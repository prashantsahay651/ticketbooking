package com.ticket.booking.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ticket.booking.bean.FlightDetails;

@org.springframework.stereotype.Controller
public class Controller {

	@GetMapping("/")
	public String index() {
		return "index";
	}

	@GetMapping("/GetPlaceName")
	public void getPlaceName(String place, HttpServletResponse response) {
		try {
			PrintWriter out = response.getWriter();
			String url = "https://api.skypicker.com/locations?term=" + place.toUpperCase()
					+ "&locale=en-US&location_types=airport&limit=10&active_only=true&sort=name";
			RestTemplate restTemplate = new RestTemplate();
			Object result = restTemplate.getForObject(url, String.class);
			out.println(result);
		} catch (Exception e) {
			System.out.println(e);
		}

	}

	public String parseDate(String date) {
		String date1 = "";
		date1 = date1 + date.substring(8, 10);
		date1 = date1 + "/";
		date1 = date1 + date.substring(5, 7);
		date1 = date1 + "/";
		date1 = date1 + date.substring(0, 4);
		return date1;
	}

	@PostMapping("/SearchFlight")
	public RedirectView searchFlight(String from1, String to1, String departure, String return1, String adult,
			String child, RedirectAttributes request, HttpSession session)
			throws ParseException, org.apache.tomcat.util.json.ParseException, IOException {
		String url = "https://api.skypicker.com/flights?flyFrom=" + from1 + "&to=" + to1 + "&dateFrom="
				+ parseDate(departure) + "&" + "dateTo=" + parseDate(return1) + "&adults=" + adult + "&children="
				+ child + "&partner=picky";
		System.out.println(url);
		RestTemplate restTemplate = new RestTemplate();
		String result = restTemplate.getForObject(url, String.class);
		ObjectMapper objectMapper = new ObjectMapper();
		// read JSON like DOM Parser
		JsonNode rootNode = objectMapper.readTree(result);
		JsonNode phoneNosNode = rootNode.path("data");
		Iterator<JsonNode> elements = phoneNosNode.elements();
		Map<String, FlightDetails> details = new HashMap<String, FlightDetails>();
		while (elements.hasNext()) {
			
			JsonNode phone = elements.next();
			JsonNode id = phone.path("id");
			System.out.println(id.asText());
			JsonNode atime = phone.path("aTime");
			JsonNode dtime = phone.path("dtime");
			JsonNode price = phone.path("price");
			JsonNode airline = phone.path("airline");
			details.put(id.asText(),
					new FlightDetails(new SimpleDateFormat("hh:mm a").format(new Date(atime.asInt() * 1000L)),
							new SimpleDateFormat("hh:mm a").format(new Date(dtime.asInt() * 1000L)), price.asText(),
							airline.asText(),from1,to1,departure,return1,adult,child));
		}

		request.addFlashAttribute("from1", from1);
		request.addFlashAttribute("to1", to1);
		request.addFlashAttribute("departure", departure);
		request.addFlashAttribute("return1", return1);
		request.addFlashAttribute("adult", adult);
		request.addFlashAttribute("child", child);
		session.setAttribute("data", details);
		request.addFlashAttribute("valueadded", "valueadded");
		return new RedirectView("/");

	}
	
	
	@PostMapping("/selectFlight")
	public RedirectView selectFlight(String flightid,HttpSession session,RedirectAttributes request) {
		Map<String, FlightDetails> details=(Map<String, FlightDetails>) session.getAttribute("data");
		FlightDetails flightDetails=details.get(flightid);
		session.setAttribute("data",details);
		request.addFlashAttribute("flightDetails",flightDetails);
		session.setAttribute("currentflight",flightDetails);
		return new RedirectView("/");
	}
	
	
	
	
	@PostMapping("/bookTicket")
	public RedirectView bookTicket(String passangerName,HttpSession session,RedirectAttributes request) {
		request.addFlashAttribute("passangerName",passangerName);
		return new RedirectView("/");
	}

}
