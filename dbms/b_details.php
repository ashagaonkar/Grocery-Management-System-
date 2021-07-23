<?php 

	//connect to db
	include('config/db_connect_admin.php');

	// check get request id parameter
	if (isset($_GET['id'])) {

		$b_id = mysqli_real_escape_string($connect, $_GET['id']);

		// make sql
		$pay_sql = "SELECT b.bill_no, c.name, pay.payment_id, b.bdate, pay.amount FROM billing_counter b, customer c, payment pay WHERE b.bill_no = $b_id AND pay.bill_no = $b_id AND c.customer_id = b.customer_id";

		// get query result
		$pay_result = mysqli_query($connect, $pay_sql);

		// fetch result in array format
		$bill = mysqli_fetch_assoc($pay_result);

		//print_r($items);

		mysqli_free_result($pay_result);
		mysqli_close($connect);		
	}

 ?>

 <!DOCTYPE html>
 <html>

 	<?php include('templates/header.php'); ?>

 	<div class="container center darkslategray-text">
 		<?php if($bill): ?>

 			<h4><?php echo htmlspecialchars($bill['bill_no']); ?></h4>
 			<p>Name: <?php echo htmlspecialchars($bill['name']); ?></p>
 			<p>Paid on: <?php echo date($bill['bdate']); ?></p>
 			<p>Payment ID: <?php echo htmlspecialchars($bill['payment_id']); ?></p>
 			<div class="card-content center">
 			</div>

 			<p>Total Amount: Rs. <?php echo htmlspecialchars($bill['amount']); ?>/-</p>
 			

 			<!-- Delete form -->
 			<form action="b_details.php" method="POST">
 			</form>

 		<?php else: ?>

 			<h5>No such bill exist!</h5>
 			
 		<?php endif; ?>
 	</div>

 	<?php include('templates/footer.php'); ?>
 
 </html>