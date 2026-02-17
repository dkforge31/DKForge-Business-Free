<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        Error
    <#elseif section = "form">
        <div class="kc-error-page">
            <div class="error-icon">⚠️</div>
            <h2>${message.summary}</h2>
            <p>An error has occurred. Please try again or contact your administrator.</p>

            <a href="${url.loginUrl}" class="kc-button-business" style="display: inline-block; margin-top: 20px;">Return to Login</a>
        </div>
    </#if>
</@layout.registrationLayout>
