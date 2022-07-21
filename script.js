const nomDomaineSelect = document.getElementById("nom-domaine-select")
const rechercheDetailleeBtn = document.getElementById("rechercheDetailleeBtn")
const rechercheSimplifieeBtn = document.getElementById("rechercheSimplifieeBtn")
const annuaireCompletBtn = document.getElementById("annuaireCompletBtn")

rechercheSimplifieeBtn.addEventListener('click', () => {
    rechercheSimplifieeBtn.classList.add("active")
    rechercheDetailleeBtn.classList.remove("active")
    annuaireCompletBtn.classList.remove("active")
    document.querySelector(".searchSimplifiee").style.display = 'block'
    document.querySelector(".searchDetaillee").style.display = 'none'

    document.querySelectorAll(".societeTable").forEach(table => table.remove())
})

rechercheDetailleeBtn.addEventListener('click', () => {
    rechercheDetailleeBtn.classList.add("active")
    rechercheSimplifieeBtn.classList.remove("active")
    annuaireCompletBtn.classList.remove("active")
    document.querySelector(".searchDetaillee").style.display = 'block'
    document.querySelector(".searchSimplifiee").style.display = 'none'

    document.querySelectorAll(".societeTable").forEach(table => table.remove())
})

annuaireCompletBtn.addEventListener("click", () => {
    annuaireCompletBtn.classList.add("active")
    rechercheSimplifieeBtn.classList.remove("active")
    rechercheDetailleeBtn.classList.remove("active")
    document.querySelector(".annuaireComplet").style.display = 'block'
    document.querySelector(".searchSimplifiee").style.display = 'none'
    document.querySelector(".searchDetaillee").style.display = 'none'

    document.querySelectorAll(".societeTable").forEach(table => table.remove())
})