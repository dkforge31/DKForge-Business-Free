<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
        <div class="kc-password-recovery">
            <h2>Reset Password</h2>
            <p>Enter your username or email and we'll send you a reset link.</p>
            
            <form id="kc-reset-password-form" class="kc-form" action="${url.loginAction}" method="post">
                <div class="kc-form-group">
                    <label for="usernameOrEmail">Username or Email</label>

                    <input 
                        type="text"
                        id="usernameOrEmail"
                        name="username" 
                        value="${(auth.attemptedUsername!'')}"
                        class="kc-input-business"
                        autofocus
                        aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                    />

                    <#if messagesPerField.existsError('username')>
                        <span class="kc-error-msg">
                            ${kcSanitize(messagesPerField.getFirstError('username'))?no_esc}
                        </span>
                    </#if>
                </div>

                <button type="submit" class="kc-button-business">Send Reset Email</button>

                <div class="kc-login-prompt">
                    <a href="${url.loginUrl}">Back to login</a>
                </div>
            </form>
        </div>
    </#if>
</@layout.registrationLayout>
