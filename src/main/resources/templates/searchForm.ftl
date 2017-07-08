<#import "/spring.ftl" as spring />
<#include "/macros/macros.ftl" />

<form method="post" action="/" id="newSearchForm">
<input type="text" id="keywords" placeholder="<@spring.message "research.keywords"/> "/>
<@inputSelect listRegions 'region' '' 'research.region' false true false />
<@inputSelect listDepartement 'dept' '' 'research.departement' false true false />

</form>
