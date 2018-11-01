#extension GL_OES_EGL_image_external_essl3 : enable
#extension GL_OES_EGL_image_external : enable
in lowp vec2 uv;
in lowp vec4 fragmentColor;
out lowp vec4 outColor;
uniform samplerExternalOES Texture0;
uniform lowp int EnableTestMode;
void main()
{
   if(EnableTestMode % 2 == 0){
        outColor = texture(Texture0, uv);
   } else {
       outColor = fragmentColor;
   }
}
