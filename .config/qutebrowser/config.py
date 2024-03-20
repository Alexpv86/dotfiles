import dracula.draw

# Load existing settings made via :set
config.load_autoconfig()

dracula.draw.blood(c, {
    'spacing': {
        'vertical': 1,
        'horizontal': 1
    }
})
config.set("colors.webpage.darkmode.enabled", True)
