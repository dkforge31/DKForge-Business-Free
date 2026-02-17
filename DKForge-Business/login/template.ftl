<#import "field.ftl" as field>

<#macro postLoginForm>
    <div id="kc-form-login" class="${properties.kcFormClass}">
        <div id="kc-form-buttons" class="${properties.kcFormButtonsClass}">
            <#nested>
        </div>
    </div>
</#macro>

<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=true isLoginPage=false>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="DKForge Business Enterprise - Secure Access Platform">
    <title>${pageTitle!'DKForge Business'}</title>
    <link rel="stylesheet" href="${url.resourcesPath}/css/business.css">
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link rel="stylesheet" href="${url.resourcesPath}/${style}">
        </#list>
    </#if>
</head>
<body class="${bodyClass}">
    <div class="kc-business-container">
        <div class="kc-business-sidebar">
            <div class="kc-sidebar-content">
                <h1>Enterprise<br>Solutions</h1>
                <p>Secure authentication platform designed for modern enterprises.</p>
                <ul class="kc-features-list">
                    <li>✓ Enterprise-grade Security</li>
                    <li>✓ Single Sign-On (SSO)</li>
                    <li>✓ Multi-factor Authentication</li>
                    <li>✓ Compliance Ready</li>
                </ul>
            </div>
        </div>

        <div class="kc-business-main">
            <!-- Header -->
            <div class="kc-business-header">
                <div class="kc-logo-business">
                    <span class="kc-logo-icon">🔐</span>
                    <div>
                        <div class="kc-logo-title">DKForge</div>
                        <div class="kc-logo-subtitle">Business Enterprise</div>
                    </div>
                </div>
                <div class="kc-business-header-section">
                    <#nested "header">
                </div>
            </div>

            <!-- Main Content -->
            <main class="kc-business-content">
                
                <#if displayMessage && message?has_content && message.type != 'error'>
                    <div class="kc-alert kc-alert-${message.type}">
                        <span>${kcSanitize(message.summary)?no_esc}</span>
                    </div>
                </#if>

                <div class="kc-form-container">
                    <#nested "form">
                </div>

                <#if displayInfo>
                    <div class="kc-info-business">
                        <#nested "info">
                    </div>
                </#if>
            </main>

            <!-- Footer -->
            <footer class="kc-business-footer">
                <p>&copy; 2026 DKForge Business. Enterprise Solutions.</p>
            </footer>
        </div>
    </div>
</body>
</html>
</#macro>
