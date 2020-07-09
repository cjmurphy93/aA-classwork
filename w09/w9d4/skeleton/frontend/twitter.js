const FollowToggle = require("./follow_toggle");
let something = 1;
$(() => {
    $("button.follow-toggle").each((i, button) => {
        new FollowToggle(button);
    });
});