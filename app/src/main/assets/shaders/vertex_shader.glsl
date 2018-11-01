#ifndef DISABLE_MULTIVIEW
    #define DISABLE_MULTIVIEW 0
#endif
#define NUM_VIEWS 2
#if defined( GL_OVR_multiview2 ) && ! DISABLE_MULTIVIEW
    #extension GL_OVR_multiview2 : enable
    layout(num_views=NUM_VIEWS) in;
    #define VIEW_ID gl_ViewID_OVR
#else
    uniform lowp int ViewID;
    #define VIEW_ID ViewID
#endif


in vec3 vertexPosition;
in vec4 vertexColor;
in mat4 vertexTransform;
in vec2 vertexUv;
uniform mat4 mvpMatrix[NUM_VIEWS];
uniform lowp int EnableTestMode;
out vec4 fragmentColor;
out vec2 uv;
void main()
{
    gl_Position = mvpMatrix[VIEW_ID] * vec4( vertexPosition, 1.0 );
    if (VIEW_ID == uint(0)) {
        uv = vec2(vertexUv.x, vertexUv.y);
    } else {
        uv = vec2(vertexUv.x + 0.5, vertexUv.y);
    }
    fragmentColor = vertexColor;
}