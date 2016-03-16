<event-collection>
	<h2> My Events </h2>
	<table>
		<thead>
		<tbody>
			<tr each = items>
				<td>{ parent.eventName }</td>
				<td> {parent.startTime} </td>
			</tr>
		</tbody>
	</table>
	this.items = [];
</event-collection>
