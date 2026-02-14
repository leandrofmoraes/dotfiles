import re
import os
import subprocess as sp
from pathlib import Path
from urllib.request import urlopen

# ------------------------------------------------------------
# 1. FUNDAÇÃO: Carregar ajustes da UI e controle de versão
# ------------------------------------------------------------
# Coloque no TOPO para que este config.py SOBRESCREVA o autoconfig.yml
# Coloque na BASE para o oposto. Recomendo TOPO para consistência.
config.load_autoconfig()  # Carrega ajustes feitos via :set / qute://settings


# ------------------------------------------------------------
# APARÊNCIA E COMPORTAMENTO GERAL
# ------------------------------------------------------------

# Smooth scrolling e zoom
c.scrolling.smooth = True
c.scrolling.bar = "always"                       # mostrar barra de rolagem
c.zoom.default = '100%'
c.zoom.mouse_divider = 512  # Sensibilidade da roda do mouse

# Histórico e sessão
#c.completion.web_history.max_items = 50
c.session.lazy_restore = True  # Abas não carregam até serem selecionadas

c.auto_save.session = True  # Salva a sessão automaticamente ao sair
c.confirm_quit = ['downloads'] # ['multiple-tabs', 'downloads']  # pergunta ao fechar com muitos tabs / downloads
c.content.geolocation = False                   # bloquear geolocalização por padrão
# c.content.notifications.enabled = False                  # bloquear notificações web por padrão
c.content.autoplay = False                       # bloquear autoplay de mídia
c.new_instance_open_target = "tab"               # abrir nova instância em nova aba

# Fontes (ajuste família/tamanho)
#c.fonts.default_family = 'JetBrains Mono, Fira Code, monospace'
c.fonts.default_family = "Iosevka Term"      # ajuste para a fonte instalada
c.fonts.default_size = '11pt'
c.fonts.tabs.selected = '11pt JetBrains Mono'
#c.fonts.completion.entry = '11pt JetBrains Mono'
#c.fonts.hints = "11pt bold"
c.fonts.keyhint = "10pt"

# Statusbar / tabs
c.tabs.position = "top" # "top" | "bottom" | "left" | "right"
c.tabs.show = 'multiple'   # Só mostra a barra se houver mais de 1 aba
c.tabs.width = 200
c.tabs.padding = {'top': 5, 'bottom': 5, 'left': 5, 'right': 5}
#c.tabs.padding = {"top": 4, "bottom": 4, "left": 6, "right": 6}
c.tabs.indicator.width = 2 # Largura da linha de indicação da aba ativa
c.tabs.indicator.padding = {'top': 0, 'bottom': 0, 'left': 0, 'right': 0}
c.tabs.favicons.show = 'always' #Values: 'always' | 'never' | 'pinned'
c.tabs.title.alignment = 'left'
c.tabs.title.format = "{current_title}"

c.statusbar.show = "always" # "always" | "never" | "in-mode" (aparece só no modo de comando) | "hidden" (só aparece se tiver algo a mostrar)
c.statusbar.position = "bottom"

# Downloads: mostrar na guia (mais discreto)
c.downloads.position = 'top'
#c.downloads.location.directory = "~/Downloads"
c.downloads.location.directory = str(Path.home() / "Downloads")
c.downloads.location.prompt = False
c.downloads.location.suggestion = "path"
c.downloads.remove_finished = 300000             # remove downloads finalizados (ms) - ajuste ou comente

# Mensagens: não suma tão rápido
c.messages.timeout = 3000

# ------------------------------------------------------------
# COMPLETION E USABILIDADE
# ------------------------------------------------------------
# autocompletar rápido
#c.completion.quick = True
#c.completion.height = "30%"
c.completion.shrink = True        # A altura acompanha o número de itens
c.completion.use_best_match = True # Auto-expande comandos únicos
# c.completion.timestamp_format = True

# DARKMODE (ativado globalmente)
#c.colors.webpage.darkmode.enabled = True
#c.colors.webpage.darkmode.policy.images = 'smart'  # Preserva imagens claras
#c.colors.webpage.darkmode.threshold.background = 200
#c.colors.webpage.darkmode.threshold.foreground = 50
#c.colors.webpage.darkmode.contrast = 1.1
#c.colors.webpage.darkmode.grayscale.all = False
#c.colors.webpage.preferred_color_scheme = "dark"

# Spellcheck (instale dicionários com scripts/dictcli.py) [citation:5][citation:6]
c.spellcheck.languages = ['en-US', 'pt-BR']  # Ajuste conforme seu idioma

# ------------------------------------------------------------
# 3. MECANISMOS DE BUSCA (comando `o` ou `O`)
# ------------------------------------------------------------

# -----------------------
# Bookmarks / quickmark examples
# -----------------------
# Salve como quickmarks em tempo de execução com :bookmark-add ou :quickmark-add (ex: :quickmark-add g https://www.google.com)
c.url.searchengines = {
    "DEFAULT": "https://www.google.com/search?q={}", # Use "DEFAULT" para o mecanismo padrão. {} é o placeholder do termo.
    'g': 'https://www.google.com/search?hl=en&q={}',              # Google
    'ddg': 'https://duckduckgo.com/?q={}',                        # DuckDuckGo
    'aw': 'https://wiki.archlinux.org/?search={}',                # Arch Wiki
    'aur': 'https://aur.archlinux.org/packages?O=0&K={}',         # AUR
    'yt': 'https://www.youtube.com/results?search_query={}',       # YouTube
    'red': 'https://old.reddit.com/r/{}',                           # Subreddit
    'gh': 'https://github.com/search?q={}',                       # GitHub
    'wp': 'https://en.wikipedia.org/w/index.php?search={}',       # Wikipedia
    'maps': 'https://www.openstreetmap.org/search?query={}',      # OpenStreetMap
    'so': 'https://pt.stackoverflow.com/search?q={}',             # StackOverflow em Português
    #'so': 'https://stackoverflow.com/search?q={}',                # StackOverflow
    #'aur': 'https://aur.archlinux.org/packages?K={}',            # AUR
}
c.url.default_page = "about:blank"
c.url.start_pages = ["https://www.google.com"]   # página inicial (ajuste)


# ------------------------------------------------------------
# PRIVACIDADE E SEGURANÇA (FINGERPRINTING E DRM)
# ------------------------------------------------------------
# User Agent genérico para minimizar fingerprint [citation:5][citation:6]
c.content.headers.user_agent = 'Mozilla/5.0 (Windows NT 10.0; rv:115.0) Gecko/20100101 Firefox/115.0'

# Headers HTTP genéricos (imitando Firefox)
c.content.headers.accept_language = 'en-US,en;q=0.5'
c.content.headers.custom = {
    'accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
}

# Proxy via Tor (opcional: descomente se tor estiver rodando)
# c.content.proxy = 'socks://localhost:9050/'

# Permitir camera/microfone para sites confiáveis somente
config.set("content.media.audio_capture", True, "https://meet.google.com/*")
config.set("content.media.video_capture", True, "https://meet.google.com/*")

# ADBLOCK:
# Necessário python-adblock instalado no sistema
c.content.blocking.enabled = True
# Método: "both" = hosts + lista adblock / "adblock" / "hosts" (depende da versão; mantenha enable/urls)
c.content.blocking.method = 'both'
# Listas adblock (exemplos - pode adicionar/remover)
c.content.blocking.adblock.lists = [
    'https://easylist.to/easylist/easylist.txt',
    'https://easylist.to/easylist/easyprivacy.txt',
    'https://secure.fanboy.co.nz/fanboy-cookiemonster.txt',
]
# OBS: atualize/avalie essas listas conforme preferir.
# Atualize as listas manualmente com :adblock-update

# Bloqueio de fingerprinting e WebGL
c.content.webgl = False

# Exemplo de bloquear cookies em sites específicos
config.set("content.cookies.accept", "never", "https://tracker.example/*")

c.content.cookies.accept = "no-3rdparty" # Bloqueia cookies de terceiros
c.content.cookies.store = True
c.content.canvas_reading = False   # Impede leitura de canvas (pode quebrar sites)
#c.content.webrtc_ip_handling_policy = 'disable_non_proxied_udp'  # Evita vazamento de IP real via WebRTC (pode quebrar chamadas de vídeo, ajuste conforme necessário)
c.content.webrtc_ip_handling_policy = "default-public-interface-only" # Permite WebRTC, mas só com IPs públicos (evita vazamento de IP local)
# Imagens e JavaScript: habilitado globalmente, mas você pode desabilitar por padrão
c.content.images = True
c.content.javascript.enabled = True
c.content.javascript.clipboard = 'ask' #Values: 'none' | 'access' | 'access-paste' | 'ask'

# Plugins e DRM (Widevine para Netflix/Spotify)
c.content.plugins = True
c.content.pdfjs = True  # Visualizador de PDF nativo


# ------------------------------------------------------------
# KEYBINDINGS: POTÊNCIA TOTAL
# ------------------------------------------------------------
# Unbind genérico para evitar conflitos (opcional)
# config.bindings.default = {}  # Remove TODOS os binds padrão (perigoso, descomente com cuidado)

config.unbind('<Ctrl-T>')

# Dvorak binds
config.unbind('H')
config.unbind('T')

config.unbind('D')
config.unbind('N')

config.unbind('l')
config.unbind('L')

config.unbind('k')
config.unbind('K')

config.unbind('h')
config.unbind('d')
config.unbind('n')

# Comma (,) é reservado para binds pessoais [citation:1][citation:3]

# -----------------------
# Integração com mpv / yt-dlp
# -----------------------
# Certifique-se de ter mpv e yt-dlp/yt-dlp instalado no sistema.
# Abrir vídeo/link no MPV (hint mode)
#config.bind(',m', 'hint links spawn --detach mpv {hint-url}')
# Comando para abrir links em mpv a partir do hint (atalho M)
config.bind(",m", "hint links spawn --detach mpv --ytdl -- ytdl-format=best {hint-url}")
# Abrir a URL atual no mpv (atalho gm)
config.bind("gm", "spawn --detach mpv --ytdl --ytdl-format=best {url}")
# Dica: use --ytdl-format para controlar qualidade, ex: bestvideo[height<=1080]+bestaudio/best

# abrir pdf com zathura (ou outro PDF viewer)
#config.bind("op", "spawn --detach zathura {path}")
config.bind("op", "hint links spawn --detach zathura {hint-url}")

# Abrir imagem diretamente
config.bind(',i', 'hint images spawn --detach feh {hint-url}')

# Bind para recarregar a configuração sem reiniciar (ESSENCIAL)
config.bind('<F5>', 'config-source')
config.bind('<Shift-F5>', 'config-source;; reload -f')

# Navegação de abas turbinada
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind('tl', 'tab-move -')  # Mover aba para esquerda
config.bind('th', 'tab-move +')  # Mover aba para direita
config.bind('tx', 'tab-close')   # d já fecha, mas redundância é conforto

# Acessar URL atual no MPV com um atalho
config.bind('<Ctrl+v>', 'spawn --detach mpv {url}')

# Atalho estilo Vim para : (dois pontos) - mais rápido
config.bind(';', 'set-cmd-text -s :')

# Prompt: navegação como Vim
config.bind('<Alt-b>', 'rl-backward-word', mode='prompt')
config.bind('<Alt-f>', 'rl-forward-word', mode='prompt')
config.bind('<Ctrl-b>', 'rl-backward-char', mode='prompt')
config.bind('<Ctrl-f>', 'rl-forward-char', mode='prompt')

# Modo de inserção: sair com jk (clássico)
config.bind('jk', 'mode-leave', mode='insert')

config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')

config.bind('1', 'tab-focus 1')
config.bind('2', 'tab-focus 2')
config.bind('3', 'tab-focus 3')
config.bind('4', 'tab-focus 4')
config.bind('5', 'tab-focus 5')
config.bind('6', 'tab-focus 6')
config.bind('7', 'tab-focus 7')
config.bind('8', 'tab-focus 8')
config.bind('9', 'tab-focus 9')
config.bind('0', 'tab-focus 10')
config.bind('!', 'tab-focus 11')
config.bind('@', 'tab-focus 12')
config.bind('#', 'tab-focus 13')
config.bind('$', 'tab-focus 14')
config.bind('%', 'tab-focus 15')
config.bind('^', 'tab-focus 16')
config.bind('&', 'tab-focus 17')
config.bind('*', 'tab-focus 18')
config.bind('(', 'tab-focus 19')
config.bind(')', 'tab-focus -1')

c.hints.chars = "aoeuidhtn"

config.bind('H', 'tab-prev')
config.bind('L', 'tab-next')

config.bind('B', 'back')
config.bind('F', 'forward')

config.bind('n', 'search-next')
config.bind('N', 'search-prev')

config.bind('x', 'tab-close')
config.bind('X', 'tab-close -o')

config.bind('j', 'scroll down')
config.bind('k', 'scroll up')
config.bind('h', 'scroll left')
config.bind('l', 'scroll right')

# ------------------------------------------------------------
# PER-DOMAIN SETTINGS (REGRA POR SITE) [citation:1]
# ------------------------------------------------------------
with config.pattern('https://www.youtube.com/*') as p:
    p.content.images = True        # YouTube precisa de imagens
    p.content.cookies.accept = 'all'  # Necessário para login

with config.pattern('https://github.com/*') as p:
    p.content.javascript.enabled = True

# Desabilitar JavaScript em sites de anúncios (exemplo)
with config.pattern('https://doubleclick.net/*') as p:
    p.content.javascript.enabled = False
    p.content.images = False

# Exemplo: site lento - desabilita imagens
with config.pattern('https://lazy-site.com/*') as p:
    p.content.images = False


# ------------------------------------------------------------
# 9. INTEGRAÇÃO COM SENHAS (PASS) [citation:5][citation:6]
# ------------------------------------------------------------
# Se você usa pass (passwordstore), este userscript é OURO.
# Baixe: https://github.com/qutebrowser/qutebrowser/blob/master/misc/userscripts/qute-pass
# c.downloads.location.directory = str(Path.home() / 'Downloads')
# config.bind('<Ctrl-p>', 'spawn --userscript qute-pass')


# ------------------------------------------------------------
# MODO EDITOR EXTERNO
# ------------------------------------------------------------
# Ajuste o terminal/editor conforme seu sistema.
# Digite 'e' em um campo de texto para abrir no editor
# Ex.: alacritty + nvim. Substitua por "kitty" ou "st" se preferir.
terminal = os.environ.get('TERMINAL', 'kitty')
c.editor.command = [terminal, '-e', 'nvim', '{file}']  # Ajuste para seu terminal/editor
#c.editor.command = [terminal, "-e", "vim", "{file}", "-c", "normal {line}G{column0}l"]

# ------------------------------------------------------------
# ALIAS (ATALHOS DE COMANDOS)
# ------------------------------------------------------------
c.aliases['qt'] = 'quit --save'
c.aliases['wq'] = 'quit --save'   # Estilo Vim
c.aliases['reload-config'] = 'config-source'
c.aliases['ad'] = 'adblock-update'
c.aliases['help-keys'] = 'help --all'

# -----------------------
# Outros ajustes / performance
# -----------------------
#c.qt.highdpi = True
c.qt.args = ["force-device-scale-factor=1"]   # ou "enable-high-dpi-scaling"
c.content.cache.size = 52428800   # 50MB cache (ajuste)
#c.network.timeout = 30           # timeout de rede em segundos

# Theme #
if not os.path.exists(config.configdir / "theme.py"):
    theme = "https://raw.githubusercontent.com/iruzo/matrix-qutebrowser/main/matrix-qutebrowser.py"
    with urlopen(theme) as themehtml:
        with open(config.configdir / "theme.py", "a") as file:
            file.writelines(themehtml.read().decode("utf-8"))

if os.path.exists(config.configdir / "theme.py"):
#   import theme
#   theme.setup(c, 'macchiato', True)
    config.source('theme.py')

# -----------------------
# Final / notas
# -----------------------
# Use :binds para checar binds atuais, :config-edit para editar este arquivo a partir do qutebrowser
# Depois de salvar este arquivo, carregue com :config-source ~/.config/qutebrowser/config.py
