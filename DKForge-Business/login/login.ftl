<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=(realm.password && realm.registrationAllowed && !registrationDisabled??); section>
    <#if section = "header">
        ${msg("loginAccountTitle")}
    <#elseif section = "form">
        <div class="kc-login-form-business">
            <#if realm.password>
                <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                    <#if !usernameHidden??>
                        <div class="kc-form-group">
                            <label for="username">
                                <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                            </label>
                            <input 
                                id="username" 
                                name="username" 
                                value="${(login.username!'')}"  
                                type="text"
                                autofocus 
                                autocomplete="username"
                                class="kc-input-business"
                                aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                            />
                            <#if messagesPerField.existsError('username','password')>
                                <span class="kc-error-msg">
                                    ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                </span>
                            </#if>
                        </div>
                    </#if>

                    <div class="kc-form-group">
                        <label for="password">${msg("password")}</label>
                        <input 
                            id="password" 
                            name="password" 
                            type="password" 
                            autocomplete="current-password"
                            class="kc-input-business"
                            aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                        />
                        <#if usernameHidden?? && messagesPerField.existsError('username','password')>
                            <span class="kc-error-msg">
                                ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <#if realm.rememberMe && !usernameHidden??>
                        <div class="kc-remember-me">
                            <input type="checkbox" id="rememberMe" name="rememberMe" class="kc-checkbox-business">
                            <label for="rememberMe">Keep me signed in</label>
                        </div>
                    </#if>

                    <button type="submit" class="kc-button-business">
                        ${msg("doLogIn")}
                    </button>

                    <#if realm.password && realm.resetPasswordAllowed>
                        <div class="kc-password-recovery">
                            <a href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
                        </div>
                    </#if>
                </form>
            </#if>

            <#if realm.password && social.providers??>
                <div class="kc-social-section">
                    <p class="kc-divider-text">Or connect with</p>
                    <div class="kc-social-buttons">
                        <#list social.providers as provider>
                            <a href="${provider.loginUrl}" class="kc-social-button">
                                ${provider.displayName}
                            </a>
                        </#list>
                    </div>
                </div>
            </#if>
        </div>
    <#elseif section = "info">
        <#if realm.registrationAllowed && !registrationDisabled??>
            <div class="kc-registration-info">
                New to DKForge? <a href="${url.registrationUrl}">Request access</a>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>
