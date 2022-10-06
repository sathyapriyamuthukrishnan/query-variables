<cfoutput>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

	<cfset student = Application.student />
	
	<cfif structKeyExists( form, 'submitBtn' )>
		<cfloop query="#student#">
			<cfif student.studentId EQ form.studentId>
				<cfset querySetCell( student, 'studentName', form.studentName, form.rownum ) />
				<cfset querySetCell( student, 'studentAge', form.studentAge, form.rownum ) />
			</cfif>
		</cfloop>
	</cfif>

	<cfif structKeyExists( form, 'addNew' )>
		<cfset queryAddRow( student, 1 ) />
		<cfset querySetCell( student, 'studentName', form.studentName )>
		<cfset querySetCell( student, 'studentAge', form.studentAge )>
	</cfif>

	<cfif structKeyExists( form, 'deleteBtn' )>
		<cfset queryDeleteRow(student, form.rownum)>
	</cfif>

	<div class="border border-secondary shadow-lg pb-5 container mt-5">
		<div class="container">
			<table class="table table-bordered mt-5">
				<h6 class="text-center mt-5">Sample table</h6>
				<div align="right">
					<button type="button" class="btn btn-secondary btn-sm" data-bs-target="##addNew" data-bs-toggle="modal">Add new+</button>
				</div>
				<tr>
					<td>S.no.</td>
					<td>Student Name</td>
					<td>Student Age</td>
					<td>Edit</td>
					<td>Delete</td>
				</tr>
				<cfloop query="student">
					<tr>
						<td>#student.currentRow#</td>
						<td>#student.studentName#</td>
						<td>#student.studentAge#</td>
						<td><a href="crud.cfm?edit=#student.currentRow#" data-bs-toggle="modal" data-bs-target="##edit#student.studentId#" class="btn btn-primary btn-sm">Edit</a></td>
						<td><a href="crud.cfm?delete=#student.currentRow#" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="##delete#student.studentId#" >Delete</a></td>
					</tr>

					<!--- Open modal to update the current values --->
					<div class="modal" id="edit#student.studentId#">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title text-center">Edit data</h4>
									<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
								</div>
								<div class="modal-body">
									<form name="student_crud_form" method="POST">
										<div class="row">
											<div class="col-md-6">
												<label for="name">Student Name</label>:
											</div>
											<div class="col-md-6 mt-1">
												<input type="text" name="studentName" id="name" class="form-control p-1 m-1" value="#student.studentName#">
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<label for="age">Student Age</label>:
											</div>
											<div class="col-md-6 mt-1">
												<input type="text" name="studentAge" id="age" class="form-control p-1 m-1" value="#student.studentAge#">
											</div>
										</div>
										<input type="hidden" name="studentId" value="#student.studentId#">
										<input type="hidden" name="rownum" value="#student.currentRow#">
										<div class="text-center p-1 m-1">
											<input type="submit" name="submitBtn" class="btn btn-success">
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>

					<!--- Confirmation modal for deleting data from table --->
					<div class="modal" id="delete#student.studentId#">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title text-center">Are you sure you want to delete?</h4>
								</div>
								<div class="modal-footer">
									<form name="student_crud_form" method="POST">
										<button type="button" class="btn btn-default" data-bs-dismiss="modal">Cancel</button>
										<input type="hidden" name="rownum" value="#student.currentRow#">
										<input type="submit" name="deleteBtn" class="btn btn-danger">
									</form>
								</div>
							</div>
						</div>
					</div>
				</cfloop>
			</table>

			<!--- Open modal to add new values to the table --->
			<div class="modal" id="addNew">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title text-center">Add new data</h4>
							<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
						</div>
						<div class="modal-body">
							<form name="student_crud_form" method="POST">
								<div class="row">
									<div class="col-md-6">
										<label for="name">Student Name</label>:
									</div>
									<div class="col-md-6 mt-1">
										<input type="text" name="studentName" id="name" class="form-controlp-1 m-1">
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<label for="age">Student Age</label>:
									</div>
									<div class="col-md-6 mt-1">
										<input type="text" name="studentAge" id="age" class="form-controlp-1 m-1">
									</div>
								</div>
								<div class="text-center">
									<input type="submit" name="addNew" class="btn btn-success p-1 m-1">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</cfoutput>