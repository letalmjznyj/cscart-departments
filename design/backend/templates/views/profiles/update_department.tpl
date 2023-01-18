{if $department}
    {assign var="id" value=$department.department_id}
{else}
    {assign var="id" value=0}
{/if}

{capture name="mainbox"}

    <form action="{""|fn_url}" method="post" class="form-horizontal form-edit" name="banners_form" enctype="multipart/form-data">
        <input type="hidden" class="cm-no-hide-input" name="fake" value="1" />
        <input type="hidden" class="cm-no-hide-input" name="department_id" value="{$id}" />

            <div id="content_general">
                <div class="control-group">
                    <label for="elm_banner_name" class="control-label cm-required">{__("name")}</label>
                    <div class="controls">
                        <input type="text" name="department_data[department]" id="elm_banner_name" value="{$department.banner}" size="25" class="input-large" />
                    </div>
                </div>

                <div class="control-group" id="banner_graphic">
                    <label class="control-label">{__("image")}</label>
                    <div class="controls">
                        {include file="common/attach_images.tpl"
                            image_name="department"
                            image_object_type="department"
                            image_pair=$department.main_pair
                            image_object_id=$id
                            no_detailed=true
                            hide_titles=true
                        }
                    </div>
                </div>

                <div class="control-group" id="banner_text">
                    <label class="control-label" for="elm_banner_description">{__("description")}:</label>
                    <div class="controls">
                        <textarea id="elm_banner_description" name="department_data[description]" cols="35" rows="8" class="cm-wysiwyg input-large">{$department.description}</textarea>
                    </div>
                </div>

                {include file="common/select_status.tpl" input_name="department_data[status]" id="elm_banner_status" obj_id=$id obj=$department hidden=false}
           
                <!--content_general--></div>

        {capture name="buttons"}
            {if !$id}
                {include file="buttons/save_cancel.tpl" but_role="submit-link" but_target_form="banners_form" but_name="dispatch[profiles.update_departments]"}
            {else}
                {include file="buttons/save_cancel.tpl" but_name="dispatch[profiles.update_department]" but_role="submit-link" but_target_form="banners_form" hide_first_button=$hide_first_button hide_second_button=$hide_second_button save=$id}
            {/if}
        {/capture}

    </form>

{/capture}

{include file="common/mainbox.tpl"
    title=($id) ? "Изменить отдел" : "Создать отдел"
    content=$smarty.capture.mainbox
    buttons=$smarty.capture.buttons
    select_languages=true}

{** banner section **}
