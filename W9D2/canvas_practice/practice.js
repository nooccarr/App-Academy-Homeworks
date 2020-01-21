document.addEventListener("DOMContentLoaded", function(){
    const canvas = document.getElementById('mycanvas');

    canvasEl.width = 500;
    canvasEl.height = 500;

    const ctx = canvas.getContext('2d')

    ctx.fillStyle = "red";
    ctx.fillRect(400, 400, 100, 100)

    ctx.beginPath();
    ctx.arc(350, 350, 50, 0, 2 * Math.PI);
    ctx.strokeStyle = "blue";
    ctx.lineWidth = 5;
    ctx.stroke();
    ctx.fillStyle = "lightblue";
    ctx.fill();
});
