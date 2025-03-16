varying vec2 v_vTexcoord;
uniform float damageAmount;

void main() {
    // Ensure damageAmount stays within 0-1
    float damageEffect = clamp(damageAmount, 0.0, 1.0);

    // If there is no damage, discard the fragment (shader will not render)
    if (damageEffect <= 0.0) {
        discard;
    }

    // Sample the game's screen texture
    vec4 baseColor = texture2D(gm_BaseTexture, v_vTexcoord);

    // Blood effect (stronger red and more visible at lower HP)
    vec4 bloodColor = vec4(0.8, 0.05, 0.05, damageEffect * 0.6);

    // OPTIONAL: Add a subtle pulsating effect when at low HP (below 25%)
    if (damageEffect > 0.75) {
        float pulse = 0.5 + 0.5 * sin(gl_FragCoord.x * 0.05 + gl_FragCoord.y * 0.05 + damageEffect * 10.0);
        bloodColor.a *= (0.9 + 0.1 * pulse); // Slight pulsing effect
    }

    // Blend the screen with the blood effect
    gl_FragColor = mix(baseColor, bloodColor, damageEffect);
}
