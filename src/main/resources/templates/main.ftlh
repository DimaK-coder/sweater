<#import "parts/common.ftlh" as c>

<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <input type="text" name="filter" value="${filter?ifExists}" class="form-control"
                       placeholder="Search by tag">
                <button class="btn btn-primary ml-3" type="submit">Search</button>
            </form>
        </div>
    </div>
    <div>
        <a class="btn btn-primary mb-3" data-toggle="collapse" href="#collapseExample" role="button"
           aria-expanded="false"
           aria-controls="collapseExample">
            Add new message
        </a>
        <div class="collapse mb-3" id="collapseExample">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" name="text" placeholder="Enter your message" class="form-control"/>
                </div>
                <div class="form-group">
                    <input type="text" name="tag" placeholder="Teg" class="form-control">
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="file" class="custom-file-input" id="customFile">
                        <label class="custom-file-label" for="customFile">Choose file</label>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Add</button>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            </form>
        </div>
    </div>

    <div class="card-columns">
        <#list messages as message>
            <div class="card my-3">
                <#if message.filename??>
                    <img class="card-img-top" src="/img/${message.filename}"/>
                </#if>
                <div class="m-2">
                    <span>${message.text}</span>
                    <i>${message.tag}</i>
                </div>
                <div class="card-footer text-muted">
                    ${message.authorName}
                </div>

            </div>
        <#else>
            No messages
        </#list>
    </div>
</@c.page>