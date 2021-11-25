<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <title>Javascript Game</title>
        <script src="../js/jquery-3.6.0.min.js"></script>
        <style>
            canvas {
                border: 1px dotted red; /*캔버스에 경계선을 그려준다.*/
                background-color: #fcff00; /*캔버스와 배경색을 지정한다.*/
            }
        </style>
        <script>
            var context; /*컨텍스트 객체*/
            var velocity; /*사용자가 입력한 공의 초기 속도*/
            var angle; /*사용자가 입력한 공의 초기 각도*/
            var ballV; /*공의 현재 속도*/
            var ballVx; /*공의 현재 x방향 속도*/
            var ballVy; /*공의 현재 y방향 속도*/
            var ballX = 10; /*공의 현재 x방향 위치*/
            var ballY = 250; /*공의 현재 y방향 위치*/
            var ballRadius = 10; /*공의 반지름*/
            var score = 0; /*점수*/
            var image = new Image(); /*이미지 객체 생성*/
            image.src = "lawn.jpg"; /*이미지 파일 이름 설정*/
            var backimage = new Image();
            backimage.src = "net.jpg";
            var timer; /*타이머 객체 변수*/

            /*공을 화면에 그린다.*/
            function drawBall() {
                context.beginPath();
                context.arc(ballX, ballY, ballRadius, 0, 2.0 * Math.PI, true);
                context.fillStyle = "red";
                context.fill();
            }

            /*배경을 화면에 그린다*/
            function drawBackground() {
                context.drawImage(image, 0, 270);
                context.drawImage(backimage, 450, 60);
            }

            /*전체 화면을 그리는 함수*/
            function draw() {
                context.clearRect(0, 0, 500, 300);
                drawBall();
                drawBackground();
            }

            /*초기화를 담당하는 함수*/
            function init() {
                ballX = 10;
                ballY = 250;
                ballRadius = 10;
                context = document.getElementById('canvas').getContext('2d');
                draw();
            }

            /*사용자가 발사 버튼을 누르면 호출된다.*/
            function start() {
                init();
                velocity = Number(document.getElementById('velocity').value);
                angle = Number(document.getElementById('angle').value);
                var angleR = angle * Math.PI / 180;

                ballVx = velocity * Math.cos(angleR);
                ballVy = -velocity * Math.sin(angleR);

                draw();
                timer = setInterval(calculate, 100);
                return false
            }

            /*공의 현재 속도와 위치를 업데이트한다.*/
            function calculate() {
                ballVy = ballVy + 1.98;

                ballX = ballX + ballVx;
                ballY = ballY + ballVy;

                /*공이 목표물에 맞았으면*/
                if ((ballX >= 450) && (ballX <= 480) && (ballY >= 60) && (ballY <= 210)) {
	                score++;
	                document.getElementById("score").innerHTML = "점수= " + score;
	                clearInterval(timer);
                }
                /*공이 경계를 벗어났으면*/
                if (ballY >= 300 || ballY < 0) {
                    clearInterval(timer);
                }
                draw();
            }
        </script>
    </head>
    <body onload="init();">
        <canvas id="canvas" width="500" height="300"></canvas>
        <div id="control">
            속도 <input id="velocity" value="30" type="number" min="0" max="100" step="1">
            각도 <input id="angle" value="45" type="number" min="0" max="90" step="1">
            <div id="score">점수 = 0</div>
            <button onclick="start()">발사</button>
        </div>
    </body>
</html>