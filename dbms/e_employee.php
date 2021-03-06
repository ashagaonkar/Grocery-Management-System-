<?php 

	include('config/db_connect_admin.php');

	$name = $email = $pnumber = $role = $city = $district = $state = $zipcode = '';
	$errors = array('name' => '', 'email' => '', 'pnumber' => '', 'role' => '', 'zipcode' => '');

	if (isset($_POST['submit'])) {
	
		// check name
		if (empty($_POST['name'])) {
			$errors['name'] = 'Name is required <br />';
		} else {
			$name = $_POST['name'];
			if (!preg_match('/^[a-zA-Z\s]+$/', $name)) {
				$errors['name'] = "Name should is letters and spaces only.";
			}

		}

		// check email
		if (empty($_POST['email'])) {
			$errors['email'] = 'An email id is required <br />';
		} else {
			$email = $_POST['email'];
			if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
				$errors['email'] = "email must be a valid email address.";
			}
		}

		// check phone number
		if (empty($_POST['pnumber'])) {
			$errors['pnumber'] = 'A phone number is required <br />';
		} else {
			$pnumber = $_POST['pnumber'];
			// if (count($number)!=10) {
			// 	$errors['number'] = "Phone number must be valid.";
			// }
		}

		// check role
		if (empty($_POST['role'])) {
			$errors['role'] = 'Role is required <br />';
		} else {
			$role = $_POST['role'];
			if (!preg_match('/^[a-zA-Z\s]+$/', $role)) {
				$errors['role'] = "Role should is letters and spaces only.";
			}

		}

		
		// check zipcode
		if (empty($_POST['zipcode'])) {
			$errors['zipcode'] = 'Zipcode is required <br />';
		} else {
			$zipcode = $_POST['zipcode'];

		}

		if (array_filter($errors)) {
			//echo "There are errors in the form";
		} else {

			$name = mysqli_real_escape_string($connect, $_POST['name']);
			$email = mysqli_real_escape_string($connect, $_POST['email']);
			$pnumber = mysqli_real_escape_string($connect, $_POST['pnumber']);
			$role = mysqli_real_escape_string($connect, $_POST['role']);
			$zipcode = mysqli_real_escape_string($connect, $_POST['zipcode']);

			// sql for address
			$sql1 = "SELECT zipcode FROM employee ";

			$result1 = mysqli_query($connect, $sql1);

			$ezip = mysqli_fetch_row($result1);

			$e_zip = $ezip[0];

			mysqli_free_result($result1);			

			//get data from db and check
			if ($zipcode != $e_zip) {
				//success
				$sql2 = "INSERT INTO address(zipcode,state,district,city) VALUES('$zipcode', '$state', '$district', '$city')";

				if (!mysqli_query($connect, $sql2)) {
					echo 'query error: ' . mysqli_error($connect);
				}
			}

			// create sql
			$sql = "INSERT INTO employee(name,email,phone_no,role,zipcode) VALUES('$name', '$email', '$pnumber', '$role', '$zipcode')";

			// save to db and check
			if (mysqli_query($connect, $sql)) {
				//success
				header('Location: e_index.php');

			} else {
				// error
				echo 'query error: ' . mysqli_error($connect);
			}
		}

	} // end of POST check

?>

<!DOCTYPE html>
<html>
	
	<?php include('templates/header.php'); ?>

	<section class="container darkred-text">
		<h4 class="center">Add Employee</h4>
		<form class="white" action="e_employee.php" method="POST">
			<label>Name</label>
			<input type="text" name="name" value="<?php echo htmlspecialchars($name) ?>">
			<div class="red-text"><?php echo $errors['name']; ?></div>
			<label>Your email:</label>
			<input type="text" name="email" value="<?php echo htmlspecialchars($email) ?>">
			<div class="red-text"><?php echo $errors['email']; ?></div>
			<label>Phone number</label>
			<input type="number" name="pnumber" value="<?php echo htmlspecialchars($pnumber) ?>">
			<div class="red-text"><?php echo $errors['pnumber']; ?></div>
			<label>Role</label>
			<input type="text" name="role" value="<?php echo htmlspecialchars($role) ?>">
			<div class="red-text"><?php echo $errors['role']; ?></div>
			<label>Zipcode</label>
			<input type="number" name="zipcode" value="<?php echo htmlspecialchars($zipcode) ?>">
			<div class="red-text"><?php echo $errors['zipcode']; ?></div>
			
			<div class="center">
				<input type="submit" name="submit" value="submit" class="btn brand z-depth-0">
			</div>
		</form>
	</section>

	<?php include('templates/footer.php'); ?>

</html>