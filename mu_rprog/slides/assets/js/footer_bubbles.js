// Function for making progress-so-far footer bubbles for slidify slides
function FooterBubbles(filled, tot_pages) {
    document.write(
        "&#x25cf ".repeat(filled) +
        "&#x25cb ".repeat(tot_pages - filled) +
        "&nbsp;"
    );
}
