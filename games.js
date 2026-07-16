// ==========================================
// games.js
// Logic for mini-games in the portfolio.
// ==========================================

// --- Tic-Tac-Toe Logic ---
let tttBoard = ['', '', '', '', '', '', '', '', ''];
let tttCurrentPlayer = 'X';
let tttGameActive = true;
const tttWinningConditions = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], // Cols
    [0, 4, 8], [2, 4, 6]             // Diagonals
];

document.querySelectorAll('.ttt-cell').forEach(cell => {
    cell.addEventListener('click', handleTttClick);
});

function handleTttClick(event) {
    const cell = event.target;
    const index = parseInt(cell.getAttribute('data-index'));
    if (tttBoard[index] !== '' || !tttGameActive) return;
    tttBoard[index] = tttCurrentPlayer;
    cell.innerText = tttCurrentPlayer;
    cell.style.color = tttCurrentPlayer === 'X' ? 'var(--main-color)' : 'var(--accent-color)';
    checkTttWin();
}

function checkTttWin() {
    let roundWon = false;
    for (let i = 0; i < tttWinningConditions.length; i++) {
        const [a, b, c] = tttWinningConditions[i];
        if (tttBoard[a] && tttBoard[a] === tttBoard[b] && tttBoard[a] === tttBoard[c]) {
            roundWon = true; break;
        }
    }
    const statusDisplay = document.getElementById('ttt-status');
    if (roundWon) {
        statusDisplay.innerText = `Player ${tttCurrentPlayer} Wins! 🎉`;
        tttGameActive = false; return;
    }
    if (!tttBoard.includes('')) {
        statusDisplay.innerText = 'Game ended in a draw!';
        tttGameActive = false; return;
    }
    tttCurrentPlayer = tttCurrentPlayer === 'X' ? 'O' : 'X';
    document.querySelector('#tictactoe-modal p').innerText = `Player ${tttCurrentPlayer}'s turn`;
}

function resetTicTacToe() {
    tttBoard = ['', '', '', '', '', '', '', '', ''];
    tttCurrentPlayer = 'X';
    tttGameActive = true;
    document.getElementById('ttt-status').innerText = '';
    document.querySelector('#tictactoe-modal p').innerText = `Player X's turn`;
    document.querySelectorAll('.ttt-cell').forEach(cell => { cell.innerText = ''; });
}

// --- Memory Match Logic ---
const memoryIcons = ['bx-rocket', 'bx-star', 'bx-heart', 'bx-diamond', 'bx-crown', 'bx-moon', 'bx-sun', 'bx-cloud'];
let memoryCards = [];
let hasFlippedCard = false;
let lockBoard = false;
let firstCard, secondCard;
let memoryMoves = 0;
let memoryMatchedPairs = 0;

function initMemoryGame() {
    const board = document.getElementById('memory-board');
    if (!board) return;
    board.innerHTML = '';
    memoryMoves = 0;
    memoryMatchedPairs = 0;
    document.getElementById('memory-moves').innerText = memoryMoves;
    document.getElementById('memory-pairs').innerText = memoryMatchedPairs;
    document.getElementById('memory-status').innerText = '';
    
    memoryCards = [...memoryIcons, ...memoryIcons];
    memoryCards.sort(() => Math.random() - 0.5);

    memoryCards.forEach((icon) => {
        const card = document.createElement('div');
        card.classList.add('memory-card');
        card.dataset.icon = icon;
        card.innerHTML = `
            <div class="memory-card-inner">
                <div class="memory-card-front"><i class='bx ${icon}'></i></div>
                <div class="memory-card-back"><i class='bx bx-question-mark'></i></div>
            </div>`;
        card.addEventListener('click', flipMemoryCard);
        board.appendChild(card);
    });
}

function flipMemoryCard() {
    if (lockBoard) return;
    if (this === firstCard) return;
    this.classList.add('flipped');
    if (!hasFlippedCard) {
        hasFlippedCard = true; firstCard = this; return;
    }
    secondCard = this;
    memoryMoves++;
    document.getElementById('memory-moves').innerText = memoryMoves;
    checkForMemoryMatch();
}

function checkForMemoryMatch() {
    let isMatch = firstCard.dataset.icon === secondCard.dataset.icon;
    if (isMatch) {
        disableMemoryCards();
        memoryMatchedPairs++;
        document.getElementById('memory-pairs').innerText = memoryMatchedPairs;
        if (memoryMatchedPairs === 8) {
            document.getElementById('memory-status').innerText = `You won in ${memoryMoves} moves! 🎉`;
        }
    } else {
        unflipMemoryCards();
    }
}

function disableMemoryCards() {
    firstCard.removeEventListener('click', flipMemoryCard);
    secondCard.removeEventListener('click', flipMemoryCard);
    resetMemoryBoard();
}

function unflipMemoryCards() {
    lockBoard = true;
    setTimeout(() => {
        firstCard.classList.remove('flipped');
        secondCard.classList.remove('flipped');
        resetMemoryBoard();
    }, 1000);
}

function resetMemoryBoard() {
    [hasFlippedCard, lockBoard] = [false, false];
    [firstCard, secondCard] = [null, null];
}

// --- Snake Logic ---
let snakeCanvas, snakeCtx;
const snakeBox = 20;
let snake = [];
let snakeFood = {};
let snakeScore = 0;
let snakeDir;
let snakeGame;

function initSnakeGame() {
    snakeCanvas = document.getElementById('snake-board');
    if (!snakeCanvas) return;
    snakeCtx = snakeCanvas.getContext('2d');
    document.getElementById('snake-status').innerText = '';
    snake = [];
    snake[0] = { x: 9 * snakeBox, y: 10 * snakeBox };
    snakeScore = 0;
    document.getElementById('snake-score').innerText = snakeScore;
    snakeDir = null;
    snakeFood = {
        x: Math.floor(Math.random() * 19 + 1) * snakeBox,
        y: Math.floor(Math.random() * 19 + 1) * snakeBox
    };
    if (snakeGame) clearInterval(snakeGame);
    snakeGame = setInterval(drawSnake, 100);
    document.addEventListener('keydown', snakeDirection);
}

function snakeDirection(event) {
    let key = event.keyCode;
    if ([37, 38, 39, 40].includes(key)) event.preventDefault();
    if (key == 37 && snakeDir != "RIGHT") snakeDir = "LEFT";
    else if (key == 38 && snakeDir != "DOWN") snakeDir = "UP";
    else if (key == 39 && snakeDir != "LEFT") snakeDir = "RIGHT";
    else if (key == 40 && snakeDir != "UP") snakeDir = "DOWN";
}

function drawSnake() {
    snakeCtx.fillStyle = getComputedStyle(document.body).getPropertyValue('--bg-color');
    snakeCtx.fillRect(0, 0, snakeCanvas.width, snakeCanvas.height);

    for (let i = 0; i < snake.length; i++) {
        snakeCtx.fillStyle = (i == 0) ? getComputedStyle(document.body).getPropertyValue('--main-color') : "#0f62fe";
        snakeCtx.fillRect(snake[i].x, snake[i].y, snakeBox, snakeBox);
        snakeCtx.strokeStyle = getComputedStyle(document.body).getPropertyValue('--bg-color');
        snakeCtx.strokeRect(snake[i].x, snake[i].y, snakeBox, snakeBox);
    }

    snakeCtx.fillStyle = "#ff4d4d";
    snakeCtx.fillRect(snakeFood.x, snakeFood.y, snakeBox, snakeBox);

    let snakeX = snake[0].x;
    let snakeY = snake[0].y;

    if (snakeDir == "LEFT") snakeX -= snakeBox;
    if (snakeDir == "UP") snakeY -= snakeBox;
    if (snakeDir == "RIGHT") snakeX += snakeBox;
    if (snakeDir == "DOWN") snakeY += snakeBox;

    if (snakeX == snakeFood.x && snakeY == snakeFood.y) {
        snakeScore++;
        document.getElementById('snake-score').innerText = snakeScore;
        snakeFood = {
            x: Math.floor(Math.random() * 19 + 1) * snakeBox,
            y: Math.floor(Math.random() * 19 + 1) * snakeBox
        };
    } else {
        snake.pop();
    }

    let newHead = { x: snakeX, y: snakeY };

    if (snakeX < 0 || snakeX >= snakeCanvas.width || snakeY < 0 || snakeY >= snakeCanvas.height || snakeCollision(newHead, snake)) {
        clearInterval(snakeGame);
        document.getElementById('snake-status').innerText = 'Game Over!';
    }
    snake.unshift(newHead);
}

function snakeCollision(head, array) {
    for (let i = 0; i < array.length; i++) {
        if (head.x == array[i].x && head.y == array[i].y) return true;
    }
    return false;
}

// --- Typing Test Logic ---
const sentences = [
    "Programming is the art of algorithm design and the craft of debugging errant code.",
    "A good programmer is someone who always looks both ways before crossing a one-way street.",
    "Web development combines design, backend structure, and client-side logic to deliver solutions.",
    "React Native allows developers to build mobile apps using only JavaScript and a unified API."
];
let typingStartTime, typingEndTime;
let typingSentence = "";

function initTypingTest() {
    document.getElementById('typing-input').value = "";
    document.getElementById('typing-input').disabled = false;
    document.getElementById('typing-status').innerText = "";
    document.getElementById('typing-wpm').innerText = "0";
    
    typingSentence = sentences[Math.floor(Math.random() * sentences.length)];
    document.getElementById('typing-sentence').innerText = typingSentence;
    typingStartTime = new Date().getTime();
    document.getElementById('typing-input').focus();
}

function checkTyping() {
    const input = document.getElementById('typing-input').value;
    if (input === typingSentence) {
        typingEndTime = new Date().getTime();
        document.getElementById('typing-input').disabled = true;
        let totalTime = (typingEndTime - typingStartTime) / 1000; // in seconds
        let words = typingSentence.split(" ").length;
        let wpm = Math.round((words / totalTime) * 60);
        document.getElementById('typing-wpm').innerText = wpm;
        document.getElementById('typing-status').innerText = "Test Complete! 🎉";
    }
}

// --- Simon Says Logic ---
let simonSequence = [];
let playerSequence = [];
let simonLevel = 0;
const simonColors = ['green', 'red', 'yellow', 'blue'];
let simonPlaying = false;

function initSimonGame() {
    simonSequence = [];
    playerSequence = [];
    simonLevel = 0;
    simonPlaying = true;
    document.getElementById('simon-status').innerText = "Watch the sequence...";
    document.getElementById('simon-level').innerText = simonLevel;
    nextSimonRound();
}

function nextSimonRound() {
    playerSequence = [];
    simonLevel++;
    document.getElementById('simon-level').innerText = simonLevel;
    document.getElementById('simon-status').innerText = "Watch the sequence...";
    
    let randomColor = simonColors[Math.floor(Math.random() * 4)];
    simonSequence.push(randomColor);
    
    playSimonSequence();
}

function playSimonSequence() {
    let i = 0;
    const interval = setInterval(() => {
        let btn = document.getElementById(`simon-${simonSequence[i]}`);
        flashSimonButton(btn, simonSequence[i]);
        i++;
        if (i >= simonSequence.length) {
            clearInterval(interval);
            setTimeout(() => { document.getElementById('simon-status').innerText = "Your turn!"; }, 500);
        }
    }, 800);
}

function flashSimonButton(btn, color) {
    if (!btn) return;
    btn.classList.add('active');
    setTimeout(() => { btn.classList.remove('active'); }, 400);
}

function simonBtnClick(color) {
    if (!simonPlaying || document.getElementById('simon-status').innerText === "Watch the sequence...") return;
    
    let btn = document.getElementById(`simon-${color}`);
    flashSimonButton(btn, color);
    playerSequence.push(color);
    
    if (playerSequence[playerSequence.length - 1] !== simonSequence[playerSequence.length - 1]) {
        document.getElementById('simon-status').innerText = `Game Over! You reached level ${simonLevel}`;
        simonPlaying = false;
        return;
    }
    
    if (playerSequence.length === simonSequence.length) {
        document.getElementById('simon-status').innerText = "Good job! Next round...";
        setTimeout(nextSimonRound, 1000);
    }
}

// --- Rock Paper Scissors Logic ---
let rpsScorePlayer = 0;
let rpsScoreCPU = 0;

function initRPS() {
    rpsScorePlayer = 0;
    rpsScoreCPU = 0;
    document.getElementById('rps-score').innerText = "0 - 0";
    document.getElementById('rps-status').innerText = "Make your move!";
}

function playRPS(playerMove) {
    const moves = ['rock', 'paper', 'scissors'];
    const cpuMove = moves[Math.floor(Math.random() * 3)];
    let result = "";
    
    if (playerMove === cpuMove) {
        result = `It's a tie! Both chose ${playerMove}.`;
    } else if (
        (playerMove === 'rock' && cpuMove === 'scissors') ||
        (playerMove === 'paper' && cpuMove === 'rock') ||
        (playerMove === 'scissors' && cpuMove === 'paper')
    ) {
        result = `You win! ${playerMove} beats ${cpuMove}. 🎉`;
        rpsScorePlayer++;
    } else {
        result = `You lose! ${cpuMove} beats ${playerMove}.`;
        rpsScoreCPU++;
    }
    
    document.getElementById('rps-score').innerText = `${rpsScorePlayer} - ${rpsScoreCPU}`;
    document.getElementById('rps-status').innerText = result;
}
