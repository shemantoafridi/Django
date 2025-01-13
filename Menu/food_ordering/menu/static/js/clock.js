function updateClock() {
    // Fetch the current date and time in Bangladesh Time Zone (Asia/Dhaka)
    const options = { timeZone: "Asia/Dhaka", hour: "2-digit", minute: "2-digit", second: "2-digit", hourCycle: "h23" };
    const formatter = new Intl.DateTimeFormat("en-US", options);
    const parts = formatter.formatToParts(new Date());

    console.log(parts);


    const hours = parseInt(parts.find(part => part.type === "hour").value, 10);
    const minutes = parseInt(parts.find(part => part.type === "minute").value, 10);
    const seconds = parseInt(parts.find(part => part.type === "second").value, 10);


    // Calculate the angles for each hand based on the time
    const hourAngle = ((hours % 12) + minutes / 60) * 30 + 90;  // 30 degrees per hour + minute adjustment
    const minuteAngle = (minutes * 6) + 90 ;  // 6 degrees per minute
    console.log(minuteAngle);

    const secondAngle = (seconds * 6) + 90;  // 6 degrees per second

    

    // Apply the rotations to the clock hands
    document.getElementById('hour').style.transform = `rotate(${hourAngle}deg)`;
    document.getElementById('minute').style.transform = `rotate(${minuteAngle}deg)`;
    document.getElementById('second').style.transform = `rotate(${secondAngle}deg)`;
}

let currentTime = new Date();
    console.log(currentTime);

setInterval(updateClock, 1000); // Update every second
updateClock();  // Initial call to set the clock