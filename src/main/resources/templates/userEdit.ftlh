<#import "parts/common.ftlh" as c>

<@c.page>
    User editor
    <form action="/user" method="post">
        <input type="text" name="username" value="${user.username}" />
        <#list user.roles as role>
            <div>
               <lable><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</lable>
            </div>
        </#list>
        <input type="hidden" name="userId" value="${user.id}" />
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button type="submit">Save</button>
    </form>
</@c.page>