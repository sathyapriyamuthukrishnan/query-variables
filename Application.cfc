<cfcomponent name="queryVariables">
	<cfset this.name="queryvariablescrud">

	<cffunction name="OnApplicationStart">
		<cfset Application.student =  queryNew("studentId, studentName, studentAge", "integer, varchar, integer", [{"studentId": 1, "studentName": 'Test student 1', "studentAge": 23 }, {"studentId": 2, "studentName": 'Test student 2', "studentAge": 22 }]  )>
	</cffunction>
</cfcomponent>
