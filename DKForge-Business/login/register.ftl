<#import "template.ftl" as layout>
<#import "field.ftl" as field>
<#import "user-profile-commons.ftl" as userProfileCommons>
<@layout.registrationLayout displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>

    <#if section = "header">
        ${msg("registerTitle")}

    <#elseif section = "form">

        <div class="kc-register-form-business">
            <h2>Create Your Account</h2>

            <form id="kc-register-form" class="kc-form" action="${url.registrationAction}" method="post">

                <!-- USERNAME -->
                <@field.input name="username" 
                             label="Username"
                             value="${(register.formData.username!'')}"
                             required=true/>

                <!-- EMAIL -->
                <@field.input name="email" 
                             label="Email Address"
                             value="${(register.formData.email!'')}"
                             required=true
                             autocomplete="email"/>

                <!-- FIRST NAME -->
                <@field.input name="firstName" 
                             label="First Name"
                             value="${(register.formData.firstName!'')}"
                             required=true/>

                <!-- LAST NAME -->
                <@field.input name="lastName" 
                             label="Last Name"
                             value="${(register.formData.lastName!'')}"
                             required=true/>

                <!-- PASSWORD -->
                <#if passwordRequired??>
                    <@field.password name="password" 
                                    label="Password"
                                    required=true
                                    autocomplete="new-password"/>

                    <@field.input name="password-confirm" 
                                 label="Confirm Password"
                                 value="${(register.formData['password-confirm']!'')}"
                                 required=true
                                 fieldName="password-confirm"
                                 autocomplete="new-password"/>
                </#if>

                <#-- Dynamic Profile Attributes -->
                <#assign builtInFields = ['username', 'email', 'firstName', 'lastName', 'password', 'password-confirm']>
                <#if profile?? && profile.attributes??>
                    <#list profile.attributes as attribute>
                        <#if !builtInFields?seq_contains(attribute.name)>
                            <#if attribute.annotations.inputType?? && attribute.annotations.inputType == 'select'>
                                <@field.select name=attribute.name 
                                              label=advancedMsg(attribute.displayName!'')!attribute.name
                                              value="${(register.formData[attribute.name]!'')}"
                                              required=attribute.required
                                              options=attribute.validators.options.options![]/>
                            <#else>
                                <@field.input name=attribute.name 
                                             label=advancedMsg(attribute.displayName!'')!attribute.name
                                             value="${(register.formData[attribute.name]!'')}"
                                             required=attribute.required/>
                            </#if>
                        </#if>
                    </#list>
                </#if>

                <button type="submit" class="kc-button-business">Create Account</button>

                <div class="kc-login-prompt kc-registration-info">
                    Already have an account? <a href="${url.loginUrl}">Sign in</a>
                </div>

            </form>
        </div>

    </#if>

</@layout.registrationLayout>
