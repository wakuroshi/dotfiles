async function checkService(url, elementId) {
    const indicator = document.querySelector(`${elementId} .status-indicator`);
    try {
        // 'no-cors' permite intentar la conexión sin que el navegador bloquee el intento
        await fetch(url, { mode: 'no-cors', cache: 'no-store' });
        
        // Si llega aquí, el servidor respondió
        indicator.style.backgroundColor = "var(--accent-blue)";
        indicator.style.boxShadow = "0 0 10px var(--accent-blue)";
    } catch (error) {
        // Si hay un error de conexión (proceso apagado)
        indicator.style.backgroundColor = "var(--accent-red)"; // Gris apagado
        indicator.style.boxShadow = "none";
    }
}

// Función para revisar todos los servicios
function updateAllStatuses() {
    checkService('http://localhost:8080', '.localhost-8080');
    checkService('http://localhost:8384', '.localhost-8384');
}

// Ejecutar al cargar y cada 10 segundos
updateAllStatuses();
setInterval(updateAllStatuses, 10000);


