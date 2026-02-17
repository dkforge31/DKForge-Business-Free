<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>

    <#if section = "header">
        ${msg("updatePasswordTitle")}

    <#elseif section = "form">

        <div class="kc-form-content">
            <h2 class="form-title">🔐 Update Password</h2>

            <form class="kc-business-form"
                  action="<#if url.updatePasswordUrl??>${url.updatePasswordUrl}<#else>${url.loginAction}</#if>"
                  method="post">

                <#-- Only show current password field if Keycloak provided the object -->
                <#if password?? && password.passwordSet>
                    <div class="kc-form-group">
                        <label for="password">Current Password</label>
                        <input type="password" id="password" name="password" class="kc-input-business" 
                               aria-invalid="<#if messagesPerField.existsError('password')>true<#else>false</#if>" />
                        <#if messagesPerField.existsError('password')>
                            <span class="kc-error-msg" aria-live="polite">
                                ${kcSanitize(messagesPerField.getFirstError('password'))?no_esc}
                            </span>
                        </#if>
                    </div>
                </#if>

                <div class="kc-form-group">
                    <label for="password-new">New Password</label>
                    <input type="password" id="password-new" name="password-new" class="kc-input-business" 
                           aria-invalid="<#if messagesPerField.existsError('password-new')>true<#else>false</#if>" />
                    <#if messagesPerField.existsError('password-new')>
                        <span class="kc-error-msg" aria-live="polite">
                            ${kcSanitize(messagesPerField.getFirstError('password-new'))?no_esc}
                        </span>
                    </#if>
                </div>

                <div class="kc-form-group">
                    <label for="password-confirm">Verify Password</label>
                    <input type="password" id="password-confirm" name="password-confirm" class="kc-input-business" 
                           aria-invalid="<#if messagesPerField.existsError('password-confirm')>true<#else>false</#if>" />
                    <#if messagesPerField.existsError('password-confirm')>
                        <span class="kc-error-msg" aria-live="polite">
                            ${kcSanitize(messagesPerField.getFirstError('password-confirm'))?no_esc}
                        </span>
                    </#if>
                </div>

                <button type="submit" class="kc-button-business">Update Password</button>
            </form>
        </div>

    </#if>

</@layout.registrationLayout>
