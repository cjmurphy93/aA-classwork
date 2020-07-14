import React from 'react';

class Clock extends React.Component {

    constructor() {
        super();
        this.state = {time: new Date()};
        this.tick = this.tick.bind(this);
    }

    tick(){
        // e.preventDefault();
        // debugger
        this.setState({time: new Date()});
    }

    componentDidMount() {
        this.handle = setInterval(this.tick, 1000);
    }

    componentWillUnmount() {
        clearInterval(this.handle);
    } 

    render() {
        let hours = this.state.time.getHours();
        let minutes = this.state.time.getMinutes();
        let seconds = this.state.time.getSeconds();
        let date = this.state.time.toDateString()
        let month = this.state.time.getMonth();
        let year = this.state.time.getYear();
        return (
            <section className="date-time">
                <h3 className="title">Clock:</h3>
                <div className= "clock-box">
                    <div className="clock">
                        <p>Time:</p>
                        <p>{hours}:{minutes}:{seconds}</p>
                    </div>
                    <div className="date">
                        <p>Date:</p>
                        <p>{date}</p>
                    </div>
                </div>     
            </section>     
        )
    }

}

export default Clock;