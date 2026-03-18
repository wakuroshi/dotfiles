const greetingEl = document.querySelector('.greeting');
const dateEl = document.querySelector('.date');
const timeEl = document.querySelector('.time');

function updateDateTime() {
    const now = new Date();
    const hour = now.getHours();

    let greetingText = "Guten Tag!";
    if (hour < 11) greetingText = "Guten Morgen";
    else if (hour > 17) greetingText = "Guten Abend.";
    else if (hour > 20) greetingText = "Guten Nacht... "
    greetingEl.textContent = `${greetingText}`;

    const day = String(now.getDate()).padStart(2, '0');
    const month = String(now.getMonth() + 1).padStart(2, '0');
    const year = now.getFullYear();
    dateEl.textContent = `${day}.${month}.${year}`;

    const hours = String(now.getHours()).padStart(2, '0');
    const minutes = String(now.getMinutes()).padStart(2, '0');
    const seconds = String(now.getSeconds()).padStart(2, '0');
    timeEl.textContent = `${hours}:${minutes}:${seconds}`;
}

updateDateTime();
setInterval(updateDateTime, 1000);
// Add this to greeting.js
function corruptMemory(elementSelector, intensity = 0.05) {
    const el = document.querySelector(elementSelector);
    if (!el) return;

    // Store the original pristine text in a data attribute
    if (!el.dataset.original) {
        el.dataset.original = el.textContent;
    }

    const originalText = el.dataset.original;
    let corruptedText = "";

    for (let i = 0; i < originalText.length; i++) {
        // Random chance to "flip a bit" based on intensity
        if (Math.random() < intensity) {
            const hexCorruptions = ["0x", "FF", "??", "ERR"];
            const charCorruptions = ["!", "@", "#", "$", "%", "¶", "§", "¥"];
            
            // 50/50 chance between a hex code or a symbol
            corruptedText += Math.random() > 0.5 
                ? `<span style="color: var(--accent-red); font-weight: bold;">${hexCorruptions[Math.floor(Math.random() * hexCorruptions.length)]}</span>`
                : charCorruptions[Math.floor(Math.random() * charCorruptions.length)];
        } else {
            corruptedText += originalText[i];
        }
    }
    
    el.innerHTML = corruptedText;
}

// Call it alongside your existing interval
setInterval(() => {
    // Only corrupt the greeting 30% of the time to keep it legible but unsettling
    if (Math.random() < 0.3) {
        corruptMemory('.greeting', 0.15);
    } else {
        // Restore to normal
        const greetingEl = document.querySelector('.greeting');
        if (greetingEl.dataset.original) {
            greetingEl.innerHTML = greetingEl.dataset.original;
        }
    }
}, 150); // Run fast to mimic flickering
