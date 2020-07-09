const APIUtil = require("./api_util")

class FollowToggle {
    constructor(el) {
        this.$el = $(el);
        this.userID = this.$el.data("user-id");
        this.followState = this.$el.data("initial-follow-state");
        this.render();

        this.$el.on("click", this.handleClick.bind(this));
    };

    render() {
        if (this.followState === "followed") {
            this.$el.prop('disabled', false);
            this.$el.html("Unfollow!");
        } else if (this.followState === "unfollowed") {
            this.$el.prop('disabled', false);
            this.$el.html("Follow!");
        } else if (this.followState === "unfollowing") {
            this.$el.prop('disabled', true);
            this.$el.html("Unfollowing...");
        } else if (this.followState === "following") {
            this.$el.prop('disabled', true);
            this.$el.html("Following...");
        };
    
    };
    // this needs to ne the callback. Set this as the call back for the event listener. 
    handleClick(event) {   
        const that = this;
        event.preventDefault();

        if (this.followState === "followed") {
            
            this.followState = "unfollowing";
            this.render();
            APIUtil.unfollowUser(this.userID).then(() => {
                that.followState = "unfollowed";
                that.render();
            }); 
        } else if ( this.followState === "unfollowed") {
            
            this.followState = "following";
            this.render();
            APIUtil.followUser(this.userID).then(() => {
                that.followState = "followed";
                that.render();
            });
        }   
      
    }
}


module.exports = FollowToggle;