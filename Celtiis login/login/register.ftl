<#import "template.ftl" as layout>

<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        <title>AGL&RF - ${msg("loginAccountTitle")}</title>
    <#elseif section = "form">
        <div class="container">
            <span></span>
            <span></span>
            <span></span>
            <form id="kc-form-register" onsubmit="register.disabled = true; return true;" action="${url.registrationAction}" method="post">
                <h2>${msg("registerTitle")}</h2>
                
                <div class="inputBox">
                    <input tabindex="1" id="username" name="username" value="${(register.username!'')}" type="text" placeholder="${msg('username')}" required aria-invalid="<#if messagesPerField.existsError('username')>true</#if>" />
                    <#if messagesPerField.existsError('username')>
                        <span class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.getFirstError('username'))?no_esc}
                        </span>
                    </#if>
                </div>

                <div class="inputBox">
                    <input tabindex="2" id="email" name="email" value="${(register.email!'')}" type="email" placeholder="${msg('email')}" required aria-invalid="<#if messagesPerField.existsError('email')>true</#if>" />
                    <#if messagesPerField.existsError('email')>
                        <span class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.getFirstError('email'))?no_esc}
                        </span>
                    </#if>
                </div>

                <div class="inputBox">
                    <input tabindex="3" id="password" name="password" type="password" placeholder="${msg('password')}" required aria-invalid="<#if messagesPerField.existsError('password')>true</#if>" />
                </div>

                <div class="inputBox">
                    <input tabindex="4" id="password-confirm" name="password-confirm" type="password" placeholder="${msg('password-confirm')}" required aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>" />
                </div>

                <div class="inputBox">
                    <input tabindex="5" type="submit" value="${msg('register')}" class="${properties.kcButtonClass!}" />
                </div>
            </form>
        </div>

    <#elseif section = "info">
        <!-- Optionally handle additional info here -->
    <#elseif section = "socialProviders">
        <!-- Optionally handle social providers here -->
    </#if>

    <div class="slideshow">
        <img src="${url.resourcesPath}/IMG/top-appel.png" alt="Image 1">
        <img src="${url.resourcesPath}/IMG/forfait-mixte.png" alt="Image 2">
        <img src="${url.resourcesPath}/IMG/celtiis-fibre.png" alt="Image 3">
        <img src="${url.resourcesPath}/IMG/celtiis-business-colocalisation-hero.png" alt="Image 4">
        <img src="${url.resourcesPath}/IMG/celtiis-main-hero-2.png" alt="Image 5">
        <img src="${url.resourcesPath}/IMG/celtiis-mobile-hero.png" alt="Image 6">
        <img src="${url.resourcesPath}/IMG/celtiis-business-se-connecter-hero.png" alt="Image 7">
    </div>
</@layout.registrationLayout>
