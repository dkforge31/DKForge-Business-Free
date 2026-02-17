<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        Information
    <#elseif section = "form">
        <div class="kc-info-page">
            <div class="info-icon">ℹ️</div>
            <h2>Please Check Your Email</h2>
            <p>${message.summary}</p>
            <p style="margin-top: 20px; color: var(--text-light);">A confirmation link has been sent to your email address. Please click the link to complete your registration.</p>

            <a href="${url.loginUrl}" class="kc-button-business" style="display: inline-block; margin-top: 20px;">Back to Login</a>
        </div>
    </#if>
</@layout.registrationLayout>
