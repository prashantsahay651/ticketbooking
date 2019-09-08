<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Ticket</title>
<meta charset="utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/js/main.js"></script>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet"
	href="http://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div class="container frommain">
		<c:if test="${requestScope.flightDetails==null}">
			<c:if test="${requestScope.passangerName==null}">
				<form action="/SearchFlight" method="post">
					<div class="row">
						<div class="col-md-6">
							<label class="fromlabel">From</label><br> <span
								class="frommarker"><i class="fa fa-map-marker"
								aria-hidden="true"></i></span> <input type="text" name="from1"
								id="from" value="${requestScope.from1}">
						</div>
						<div class="col-md-6">
							<label class="fromlabel">To</label><br> <span
								class="tomarker"><i class="fa fa-map-marker"
								aria-hidden="true"></i></span> <input type="text" id="to" name="to1"
								value="${requestScope.to1}">
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-6">
							<label class="fromlabel">DEPARTURE</label><br>  <input type="date" name="departure"
								value="${requestScope.departure}">
						</div>
						<div class="col-md-6">
							<label class="fromlabel">RETURN</label><br> <input type="date" name="return1"
								value="${requestScope.return1}">
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-6">
							<div class="row">
								<div class="col-md-3">
									<label class="fromlabel">Adult</label>
									<div class="input-group">
										<input type="button" value="-" class="button-minus"
											data-field="quantity"> <input type="number" step="1"
											max="" value="1" name="adult" class="quantity-field"
											value="${requestScope.adult}"> <input type="button"
											value="+" class="button-plus" data-field="quantity">
									</div>
								</div>
								<div class="col-md-3">
									<label class="fromlabel">Child</label>
									<div class="input-group">
										<input type="button" value="-" class="button-minus"
											data-field="quantity"> <input type="number" step="1"
											max="" value="1" name="child" class="quantity-field"
											value="${requestScope.child}"> <input type="button"
											value="+" class="button-plus" data-field="quantity">
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 submitbutton">

							<button type="submit">Search</button>

						</div>
					</div>
				</form>
			</c:if>
		</c:if>
		<c:if test="${requestScope.valueadded==null}">
			<c:if test="${requestScope.flightDetails==null}">
				<c:if test="${requestScope.passangerName==null}">
					<div class="row adasection">
						<div class="col-md-12">
							<h3>Flat 25% Instant Discount on International Hotel</h3>
							<h4>Exclusive Offer* on American Express Cards</h4>
							<h4>
								Coupon Code : <strong>FLTOFFR</strong>
							</h4>
							<img src="/images/qwerty.jpeg">
						</div>

					</div>
				</c:if>
			</c:if>
		</c:if>
		<c:if test="${requestScope.valueadded!=null}">
			<div class="row adasection1">
				<div class="col-md-12 addsectionsub">
					<c:forEach var="entry" items="${sessionScope.data}">
						<div class="row airlinedetails">
							<div class="col-md-2 airline">
								<img src="/images/download.jpg" class="rounded">
								<p>${entry.value.getAirline()}</p>
							</div>
							<div class="col-md-4">
								<span><strong>${entry.value.getStartTime()} -
										${entry.value.getEndTime()}</strong></span>
							</div>
							<div class="col-md-4">
								<p>${requestScope.from1}-${requestScope.to1}</p>
								<form method="post" action="selectFlight">
									<input type="hidden" value="${entry.key}" name="flightid">
									<button class="button1" type="submit">${entry.value.getPrice()}</button>
								</form>

							</div>
						</div>
					</c:forEach>

				</div>
			</div>
		</c:if>
	</div>
	<c:if test="${requestScope.flightDetails!=null}">
		<div class="row adasection1">
			<div class="col-md-12 addsectionsub">
				<div class="row airlinedetails">
					<div class="col-md-2 airline">
						<img src="/images/download.jpg" class="rounded">
						<p>${requestScope.flightDetails.getAirline()}</p>
					</div>
					<div class="col-md-4">
						<span><strong>${requestScope.flightDetails.getStartTime()}
								- ${requestScope.flightDetails.getEndTime()}</strong></span>
					</div>
					<div class="col-md-4">
						<p>${requestScope.flightDetails.getFrom()}-${requestScope.flightDetails.getTo()}</p>
						<button class="button1">${requestScope.flightDetails.getPrice()}</button>
					</div>
				</div>
			</div>
			<div class="container frommain12">
				<form action="bookTicket" method="post">
					<div class="row">
						<div class="col-md-6">
							<label class="fromlabel">From</label><br> <span
								class="frommarker"><i class="fa fa-map-marker"
								aria-hidden="true"></i></span> <input type="text" name="from1"
								id="from" value="${requestScope.flightDetails.getFrom()}"
								readonly="readonly">
						</div>
						<div class="col-md-6">
							<label class="fromlabel">To</label><br> <span
								class="tomarker"><i class="fa fa-map-marker"
								aria-hidden="true"></i></span> <input type="text" id="to" name="to1"
								value="${requestScope.flightDetails.getTo()}"
								readonly="readonly">
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-6">
							<label class="fromlabel">Passanger Name</label><br> <input
								type="text" name="passangerName">
						</div>
						<div class="col-md-6">
							<label class="fromlabel">Details</label><br> <input
								type="text" id="to" name="to1"
								value="${requestScope.flightDetails.getAdult()} Adult ${requestScope.flightDetails.getChild()} Child"
								readonly="readonly">
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-6">
							<label class="fromlabel">Departure</label><br> <input
								type="text" name="from1" id="from"
								value="${requestScope.flightDetails.getDeparture()}"
								readonly="readonly">
						</div>
						<div class="col-md-6">
							<label class="fromlabel">Return</label><br> <input
								type="text" id="to" name="to1"
								value="${requestScope.flightDetails.getReturn1()}"
								readonly="readonly">
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 submitbutton">
							<button type="submit">Book</button>
						</div>
					</div>
				</form>
			</div>
			<div class="row adasection1">
				<div class="col-md-12 addsectionsub">
					<c:forEach var="entry" items="${sessionScope.data}">
						<div class="row airlinedetails">
							<div class="col-md-2 airline">
								<img src="/images/download.jpg" class="rounded">
								<p>${entry.value.getAirline()}</p>
							</div>
							<div class="col-md-4">
								<span><strong>${entry.value.getStartTime()} -
										${entry.value.getEndTime()}</strong></span>
							</div>
							<div class="col-md-4">
								<p>${requestScope.from1}-${requestScope.to1}</p>
								<form method="post" action="selectFlight">
									<input type="hidden" value="${entry.key}" name="flightid">
									<button class="button1" type="submit">${entry.value.getPrice()}</button>
								</form>

							</div>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${requestScope.passangerName!=null}">
		<div class="container conform">
			<h3>Booking Confirmed</h3>
			<div class="col-md-12 conformsub">
				<form action="bookTicket" method="post">
					<div class="row">
						<div class="col-md-6">
							<label class="fromlabel">From</label><br> <span
								class="frommarker"><i class="fa fa-map-marker"
								aria-hidden="true"></i></span> <input type="text" name="from1"
								id="from" value="${sessionScope.currentflight.getFrom()}"
								readonly="readonly">
						</div>
						<div class="col-md-6">
							<label class="fromlabel">To</label><br> <span
								class="tomarker"><i class="fa fa-map-marker"
								aria-hidden="true"></i></span> <input type="text" id="to" name="to1"
								value="${sessionScope.currentflight.getTo()}"
								readonly="readonly">
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-6">
							<label class="fromlabel">Passanger Name</label><br> <input
								type="text" name="passangerName"
								value="${requestScope.passangerName}" readonly="readonly">
						</div>
						<div class="col-md-6">
							<label class="fromlabel">Details</label><br> <input
								type="text" id="to" name="to1"
								value="${sessionScope.currentflight.getAdult()} Adult ${sessionScope.currentflight.getChild()} Child"
								readonly="readonly">
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-6">
							<label class="fromlabel">Departure</label><br> <input
								type="text" name="from1" id="from"
								value="${sessionScope.currentflight.getDeparture()}"
								readonly="readonly">
						</div>
						<div class="col-md-6">
							<label class="fromlabel">Return</label><br> <input
								type="text" id="to" name="to1"
								value="${sessionScope.currentflight.getReturn1()}"
								readonly="readonly">
						</div>
					</div>
				</form>
			</div>
		</div>
	</c:if>
</body>
</html>
