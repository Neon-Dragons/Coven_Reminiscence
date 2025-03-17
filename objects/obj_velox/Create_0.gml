event_inherited();

isFriendly = irandom(1); // Randomly decides if the object is friendly (0 or 1)

if (isFriendly) {
    path_start(veloxPath, 1, path_action_reverse, false); // Friendly stays on path
}
