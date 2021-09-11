local is_dark = vim.o.background == 'dark'
local definitions = {}

function definitions.editor(opt, colors)
    local d = {}

    -- ####### Common: Start
    -- UI: Start
    if opt.transparent_bg then
        d.Normal = { fg = colors.fg0 }
        d.Terminal = { fg = colors.fg0 }
        d.EndOfBuffer = { fg = colors.bg0 }
        d.FoldColumn = { fg = colors.grey0 }
        d.Folded = { fg = colors.grey1 }
        d.SignColumn = { fg = colors.fg0 }
        d.ToolbarLine = { fg = colors.fg0 }
    else
        d.Normal = { fg = colors.fg0, bg = colors.bg0 }
        d.Terminal = { fg = colors.fg0, bg = colors.bg0 }
        d.EndOfBuffer = { fg = colors.bg0, bg = colors.bg0 }
        d.Folded = { fg = colors.grey1, bg = colors.bg2 }
        d.ToolbarLine = { fg = colors.fg1, bg = colors.bg3 }
        d.SignColumn = { fg = colors.fg0 }
        d.FoldColumn = { fg = colors.grey0 }
    end

    d.NormalInverse = { fg = colors.bg0, bg = colors.fg0 }
    d.MsgArea = { link = 'Fg' }
    d.IncSearch = { fg = colors.bg0, bg = colors.bg_red }
    d.Search = { fg = colors.bg0, bg = colors.bg_yellow }
    d.ColorColumn = { bg = colors.bg2 }
    d.Conceal = { fg = colors.grey0 }
    d.Cursor = { gui = 'reverse' }
    d.vCursor = { link = 'Cursor' }
    d.iCursor = { link = 'Cursor' }
    d.lCursor = { link = 'Cursor' }
    d.CursorIM = { link = 'Cursor' }

    if vim.wo.diff then
        d.CursorLine = { gui = 'underline' }
        d.CursorColumn = { gui = 'bold' }
    else
        d.CursorLine = { bg = colors.bg1 }
        d.CursorColumn = { bg = colors.bg1 }
    end

    d.CursorLineNr = { fg = colors.grey2 }
    d.LineNr = { fg = colors.grey0 }
    d.DiffAdd = { bg = colors.bg_diff_green }
    d.DiffChange = { bg = colors.bg_diff_blue }
    d.DiffDelete = { bg = colors.bg_diff_red }
    d.DiffText = { fg = colors.bg0, bg = colors.fg0 }
    d.Directory = { fg = colors.green }
    d.ErrorMsg = { fg = colors.red, gui = 'bold,underline' }
    d.WarningMsg = { fg = colors.yellow, gui = 'bold' }
    d.ModeMsg = { fg = colors.fg0, gui = 'bold' }
    d.MoreMsg = { fg = colors.yellow, gui = 'bold' }
    d.MatchParen = { bg = colors.bg4 }
    d.NonText = { fg = colors.bg5 }
    d.Whitespace = { fg = colors.bg5 }
    d.SpecialKey = { fg = colors.bg5 }
    d.Pmenu = { fg = colors.fg1, bg = colors.bg3 }
    d.PmenuSbar = { bg = colors.bg3 }
    d.PmenuSel = { fg = colors.bg3, bg = colors.grey2 }
    d.WildMenu = { link = 'PmenuSel' }
    d.PmenuThumb = { bg = colors.grey0 }
    d.NormalFloat = { fg = colors.fg1, bg = colors.bg3 }
    d.Question = { fg = colors.yellow }
    d.SpellBad = { fg = colors.red, gui = 'undercurl' }
    d.SpellCap = { fg = colors.blue, gui = 'undercurl' }
    d.SpellLocal = { fg = colors.aqua, gui = 'undercurl' }
    d.SpellRare = { fg = colors.purple, gui = 'undercurl' }
    d.StatusLine = { fg = colors.fg1, bg = colors.bg_statusline2 }
    d.StatusLineTerm = { fg = colors.fg1, bg = colors.bg_statusline2 }
    d.StatusLineNC = { fg = colors.grey2, bg = colors.bg_statusline2 }
    d.StatusLineTermNC = { fg = colors.grey2, bg = colors.bg_statusline2 }
    d.TabLine = { fg = colors.fg1, bg = colors.bg4 }
    d.TabLineFill = { fg = colors.fg0, bg = colors.bg0 }
    d.TabLineSel = { fg = colors.bg0, bg = colors.grey2 }
    d.VertSplit = { fg = colors.bg5 }
    d.Visual = { bg = colors.bg3 }
    d.VisualNOS = { bg = colors.bg3 }
    d.QuickFixLine = { fg = colors.purple, gui = 'bold' }
    d.Debug = { fg = colors.orange }
    d.debugPC = { fg = colors.bg0, bg = colors.green }
    d.debugBreakpoint = { fg = colors.bg0, bg = colors.red }
    d.ToolbarButton = { fg = colors.bg0, bg = colors.grey2 }
    d.Substitute = { fg = colors.bg0, bg = colors.yellow }
    d.LspDiagnosticsFloatingError = { link = 'ErrorFloat' }
    d.LspDiagnosticsFloatingWarning = { link = 'WarningFloat' }
    d.LspDiagnosticsFloatingInformation = { link = 'InfoFloat' }
    d.LspDiagnosticsFloatingHint = { link = 'HintFloat' }
    d.LspDiagnosticsDefaultError = { link = 'ErrorText' }
    d.LspDiagnosticsDefaultWarning = { link = 'WarningText' }
    d.LspDiagnosticsDefaultInformation = { link = 'InfoText' }
    d.LspDiagnosticsDefaultHint = { link = 'HintText' }
    d.LspDiagnosticsVirtualTextError = { link = 'Red' }
    d.LspDiagnosticsVirtualTextWarning = { link = 'Yellow' }
    d.LspDiagnosticsVirtualTextInformation = { link = 'Blue' }
    d.LspDiagnosticsVirtualTextHint = { link = 'Green' }
    d.LspDiagnosticsUnderlineError = { link = 'ErrorText' }
    d.LspDiagnosticsUnderlineWarning = { link = 'WarningText' }
    d.LspDiagnosticsUnderlineInformation = { link = 'InfoText' }
    d.LspDiagnosticsUnderlineHint = { link = 'HintText' }
    d.LspDiagnosticsSignError = { link = 'RedSign' }
    d.LspDiagnosticsSignWarning = { link = 'YellowSign' }
    d.LspDiagnosticsSignInformation = { link = 'BlueSign' }
    d.LspDiagnosticsSignHint = { link = 'AquaSign' }
    d.LspReferenceText = { link = 'CurrentWord' }
    d.LspReferenceRead = { link = 'CurrentWord' }
    d.LspReferenceWrite = { link = 'CurrentWord' }
    d.TermCursor = { link = 'Cursor' }
    d.FloatBorder = { link = 'Grey' }
    d.healthError = { link = 'Red' }
    d.healthSuccess = { link = 'Green' }
    d.healthWarning = { link = 'Yellow' }
    -- UI: End

    -- Syntax: Start
    d.Boolean = { fg = colors.purple }
    d.Number = { fg = colors.purple }
    d.Float = { fg = colors.purple }

    if opt.italic then
        d.PreProc = { fg = colors.purple, gui = 'italic' }
        d.PreCondit = { fg = colors.purple, gui = 'italic' }
        d.Include = { fg = colors.purple, gui = 'italic' }
        d.Define = { fg = colors.purple, gui = 'italic' }
        d.Conditional = { fg = colors.red, gui = 'italic' }
        d.Repeat = { fg = colors.red, gui = 'italic' }
        d.Keyword = { fg = colors.red, gui = 'italic' }
        d.Typedef = { fg = colors.red, gui = 'italic' }
        d.Exception = { fg = colors.red, gui = 'italic' }
        d.Statement = { fg = colors.red, gui = 'italic' }
    else
        d.PreProc = { fg = colors.purple }
        d.PreCondit = { fg = colors.purple }
        d.Include = { fg = colors.purple }
        d.Define = { fg = colors.purple }
        d.Conditional = { fg = colors.red }
        d.Repeat = { fg = colors.red }
        d.Keyword = { fg = colors.red }
        d.Typedef = { fg = colors.red }
        d.Exception = { fg = colors.red }
        d.Statement = { fg = colors.red }
    end

    d.Error = { fg = colors.red }
    d.StorageClass = { fg = colors.orange }
    d.Tag = { fg = colors.orange }
    d.Label = { fg = colors.orange }
    d.Structure = { fg = colors.orange }
    d.Operator = { fg = colors.orange }
    d.Title = { fg = colors.orange, gui = 'bold' }
    d.Special = { fg = colors.yellow }
    d.SpecialChar = { fg = colors.yellow }
    d.Type = { fg = colors.yellow }

    if opt.bold then
        d.Function = { fg = colors.green, gui = 'bold' }
    else
        d.Function = { fg = colors.green }
    end

    d.String = { fg = colors.green }
    d.Character = { fg = colors.green }
    d.Constant = { fg = colors.aqua }
    d.Macro = { fg = colors.aqua }
    d.Identifier = { fg = colors.blue }

    if opt.italic_comment then
        d.Comment = { fg = colors.grey0, gui = 'italic' }
        d.SpecialComment = { fg = colors.grey0, gui = 'italic' }
        d.Todo = { fg = colors.purple, gui = 'italic' }
    else
        d.Comment = { fg = colors.grey0 }
        d.SpecialComment = { fg = colors.grey0 }
        d.Todo = { fg = colors.purple }
    end

    d.Delimiter = { fg = colors.fg0 }
    d.Ignore = { fg = colors.grey1 }
    d.Underlined = { gui = 'underline' }
    -- Syntax: End

    -- Predefined: Start
    d.Fg = { fg = colors.fg0 }
    d.FgBold = { fg = colors.fg0, gui = 'bold' }
    d.Grey = { fg = colors.grey1 }
    d.Red = { fg = colors.red }
    d.Orange = { fg = colors.orange }
    d.Yellow = { fg = colors.yellow }
    d.Green = { fg = colors.green }
    d.Aqua = { fg = colors.aqua }
    d.Blue = { fg = colors.blue }
    d.Purple = { fg = colors.purple }

    if opt.italic then
        d.RedItalic = { fg = colors.red, gui = 'italic' }
        d.OrangeItalic = { fg = colors.orange, gui = 'italic' }
        d.YellowItalic = { fg = colors.yellow, gui = 'italic' }
        d.GreenItalic = { fg = colors.green, gui = 'italic' }
        d.AquaItalic = { fg = colors.aqua, gui = 'italic' }
        d.BlueItalic = { fg = colors.blue, gui = 'italic' }
        d.PurpleItalic = { fg = colors.purple, gui = 'italic' }
    else
        d.RedItalic = { fg = colors.red }
        d.OrangeItalic = { fg = colors.orange }
        d.YellowItalic = { fg = colors.yellow }
        d.GreenItalic = { fg = colors.green }
        d.AquaItalic = { fg = colors.aqua }
        d.BlueItalic = { fg = colors.blue }
        d.PurpleItalic = { fg = colors.purple }
    end

    if opt.bold then
        d.RedBold = { fg = colors.red, gui = 'bold' }
        d.OrangeBold = { fg = colors.orange, gui = 'bold' }
        d.YellowBold = { fg = colors.yellow, gui = 'bold' }
        d.GreenBold = { fg = colors.green, gui = 'bold' }
        d.AquaBold = { fg = colors.aqua, gui = 'bold' }
        d.BlueBold = { fg = colors.blue, gui = 'bold' }
        d.PurpleBold = { fg = colors.purple, gui = 'bold' }
    else
        d.RedBold = { fg = colors.red }
        d.OrangeBold = { fg = colors.orange }
        d.YellowBold = { fg = colors.yellow }
        d.GreenBold = { fg = colors.green }
        d.AquaBold = { fg = colors.aqua }
        d.BlueBold = { fg = colors.blue }
        d.PurpleBold = { fg = colors.purple }
    end

    d.RedSign = { fg = colors.red }
    d.OrangeSign = { fg = colors.orange }
    d.YellowSign = { fg = colors.yellow }
    d.GreenSign = { fg = colors.green }
    d.AquaSign = { fg = colors.aqua }
    d.BlueSign = { fg = colors.blue }
    d.PurpleSign = { fg = colors.purple }

    if opt.diagnostic_text_highlight then
        d.ErrorText = { bg = colors.bg_visual_red, gui = 'underline' }
        d.WarningText = { bg = colors.bg_visual_yellow, gui = 'underline' }
        d.InfoText = { bg = colors.bg_visual_blue, gui = 'underline' }
        d.HintText = { bg = colors.bg_visual_green, gui = 'underline' }
    else
        d.ErrorText = { gui = 'underline' }
        d.WarningText = { gui = 'underline' }
        d.InfoText = { gui = 'underline' }
        d.HintText = { gui = 'underline' }
    end

    if opt.diagnostic_line_highlight then
        d.ErrorLine = { bg = colors.bg_visual_red }
        d.WarningLine = { bg = colors.bg_visual_yellow }
        d.InfoLine = { bg = colors.bg_visual_blue }
        d.HintLine = { bg = colors.bg_visual_green }
    end

    d.ErrorFloat = { fg = colors.red, bg = colors.bg3 }
    d.WarningFloat = { fg = colors.yellow, bg = colors.bg3 }
    d.InfoFloat = { fg = colors.blue, bg = colors.bg3 }
    d.HintFloat = { fg = colors.green, bg = colors.bg3 }

    if vim.wo.diff then
        d.CurrentWord = { fg = colors.bg0, bg = colors.bg_green }
    else
        d.CurrentWord = { bg = colors.bg_current_word }
    end
    -- Predefined: End
    -- ####### Common: End

    return d
end

function definitions.plugins(opt, colors)
    local d = {}

    -- ####### Plugins: Start
    -- nvim-treesitter/nvim-treesitter
    if opt.plugins.treesitter then
        d.TSAnnotation = { link = 'Purple' }
        d.TSAttribute = { link = 'Purple' }
        d.TSBoolean = { link = 'Purple' }
        d.TSCharacter = { link = 'Yellow' }
        d.TSComment = { link = 'Grey' }
        d.TSConditional = { link = 'Red' }
        d.TSConstBuiltin = { link = 'PurpleItalic' }
        d.TSConstMacro = { link = 'Purple' }
        d.TSConstant = { link = 'Fg' }
        d.TSConstructor = { link = 'Fg' }
        d.TSError = { link = 'ErrorText' }
        d.TSException = { link = 'Red' }
        d.TSField = { link = 'Green' }
        d.TSFloat = { link = 'Purple' }
        d.TSFuncBuiltin = { link = 'Green' }
        d.TSFuncMacro = { link = 'Green' }
        d.TSFunction = { link = 'Yellow' }
        d.TSInclude = { link = 'PurpleItalic' }
        d.TSKeyword = { link = 'Red' }
        d.TSKeywordFunction = { link = 'Red' }
        d.TSLabel = { link = 'Orange' }
        d.TSMethod = { link = 'Aqua' }
        d.TSNamespace = { link = 'Blue' }
        d.TSNumber = { link = 'Purple' }
        d.TSOperator = { link = 'Orange' }
        d.TSParameter = { link = 'Fg' }
        d.TSParameterReference = { link = 'Fg' }
        d.TSProperty = { link = 'Green' }
        d.TSPunctBracket = { link = 'Fg' }
        d.TSPunctDelimiter = { link = 'Grey' }
        d.TSPunctSpecial = { link = 'Fg' }
        d.TSRepeat = { link = 'Red' }
        d.TSString = { link = 'String' }
        d.TSStringEscape = { link = 'Green' }
        d.TSStringRegex = { link = 'Green' }
        d.TSStructure = { link = 'Orange' }
        d.TSTag = { link = 'Orange' }
        d.TSTagDelimiter = { link = 'Green' }
        d.TSText = { link = 'Green' }
        d.TSEmphasis = { gui = 'bold' }
        d.TSUnderline = { gui = 'underline' }
        d.TSType = { link = 'Yellow' }
        d.TSTypeBuiltin = { link = 'Yellow' }
        d.TSURI = { link = 'markdownUrl' }
        d.TSVariable = { link = 'Fg' }
        d.TSVariableBuiltin = { link = 'PurpleItalic' }

        -- yaml
        d.yamlTSField = { link = 'Blue' }

        -- toml
        d.tomlTSProperty = { link = 'Blue' }

        -- lua
        d.luaTSField = { link = 'Fg' }

        -- rust
        d.rustTSFuncMacro = { link = 'Aqua' }
    end

    -- neoclide/coc.nvim
    if opt.plugins.coc then
        d.CocHoverRange = { gui = 'bold,underline' }
        d.CocErrorFloat = { link = 'ErrorFloat' }
        d.CocWarningFloat = { link = 'WarningFloat' }
        d.CocInfoFloat = { link = 'InfoFloat' }
        d.CocHintFloat = { link = 'HintFloat' }
        d.CocErrorHighlight = { link = 'ErrorText' }
        d.CocWarningHighlight = { link = 'WarningText' }
        d.CocInfoHighlight = { link = 'InfoText' }
        d.CocHintHighlight = { link = 'HintText' }
        d.CocHighlightText = { link = 'CurrentWord' }
        d.CocErrorSign = { link = 'RedSign' }
        d.CocWarningSign = { link = 'YellowSign' }
        d.CocInfoSign = { link = 'BlueSign' }
        d.CocHintSign = { link = 'AquaSign' }
        d.CocWarningVirtualText = { link = 'Yellow' }
        d.CocErrorVirtualText = { link = 'Red' }
        d.CocInfoVirtualText = { link = 'Blue' }
        d.CocHintVirtualText = { link = 'Green' }
        d.CocErrorLine = { link = 'ErrorLine' }
        d.CocWarningLine = { link = 'WarningLine' }
        d.CocInfoLine = { link = 'InfoLine' }
        d.CocHintLine = { link = 'HintLine' }
        d.CocCodeLens = { link = 'Grey' }
        d.HighlightedyankRegion = { link = 'Visual' }
        d.CocGitAddedSign = { link = 'GreenSign' }
        d.CocGitChangeRemovedSign = { link = 'PurpleSign' }
        d.CocGitChangedSign = { link = 'BlueSign' }
        d.CocGitRemovedSign = { link = 'RedSign' }
        d.CocGitTopRemovedSign = { link = 'RedSign' }
        d.CocExplorerBufferRoot = { link = 'Orange' }
        d.CocExplorerBufferExpandIcon = { link = 'Aqua' }
        d.CocExplorerBufferBufnr = { link = 'Purple' }
        d.CocExplorerBufferModified = { link = 'Yellow' }
        d.CocExplorerBufferReadonly = { link = 'Red' }
        d.CocExplorerBufferBufname = { link = 'Grey' }
        d.CocExplorerBufferFullpath = { link = 'Grey' }
        d.CocExplorerFileRoot = { link = 'Orange' }
        d.CocExplorerFileRootName = { link = 'Green' }
        d.CocExplorerFileExpandIcon = { link = 'Aqua' }
        d.CocExplorerFileFullpath = { link = 'Grey' }
        d.CocExplorerFileDirectory = { link = 'Green' }
        d.CocExplorerFileGitStaged = { link = 'Purple' }
        d.CocExplorerFileGitUnstaged = { link = 'Yellow' }
        d.CocExplorerFileGitRootStaged = { link = 'Purple' }
        d.CocExplorerFileGitRootUnstaged = { link = 'Yellow' }
        d.CocExplorerGitPathChange = { link = 'Fg' }
        d.CocExplorerGitContentChange = { link = 'Fg' }
        d.CocExplorerGitRenamed = { link = 'Purple' }
        d.CocExplorerGitCopied = { link = 'Fg' }
        d.CocExplorerGitAdded = { link = 'Green' }
        d.CocExplorerGitUntracked = { link = 'Blue' }
        d.CocExplorerGitUnmodified = { link = 'Fg' }
        d.CocExplorerGitUnmerged = { link = 'Orange' }
        d.CocExplorerGitMixed = { link = 'Aqua' }
        d.CocExplorerGitModified = { link = 'Yellow' }
        d.CocExplorerGitDeleted = { link = 'Red' }
        d.CocExplorerGitIgnored = { link = 'Grey' }
        d.CocExplorerFileSize = { link = 'Blue' }
        d.CocExplorerTimeAccessed = { link = 'Aqua' }
        d.CocExplorerTimeCreated = { link = 'Aqua' }
        d.CocExplorerTimeModified = { link = 'Aqua' }
        d.CocExplorerIndentLine = { link = 'Conceal' }
        d.CocExplorerHelpDescription = { link = 'Grey' }
        d.CocExplorerHelpHint = { link = 'Grey' }
        d.CocFadeOut = { link = 'WarningText' }
    end

    -- prabirshrestha/vim-lsp
    if opt.plugins['vim-lsp'] then
        d.LspErrorVirtual = { link = 'Red' }
        d.LspWarningVirtual = { link = 'Yellow' }
        d.LspInformationVirtual = { link = 'Blue' }
        d.LspHintVirtual = { link = 'Green' }
        d.LspErrorHighlight = { link = 'ErrorText' }
        d.LspWarningHighlight = { link = 'WarningText' }
        d.LspInformationHighlight = { link = 'InfoText' }
        d.LspHintHighlight = { link = 'HintText' }
        d.lspReference = { link = 'CurrentWord' }
    end

    -- ycm-core/YouCompleteMe
    if opt.plugins.ycm then
        d.YcmErrorSign = { link = 'RedSign' }
        d.YcmWarningSign = { link = 'YellowSign' }
        d.YcmErrorLine = { link = 'ErrorLine' }
        d.YcmWarningLine = { link = 'WarningLine' }
        d.YcmErrorSection = { link = 'ErrorText' }
        d.YcmWarningSection = { link = 'WarningText' }
    end

    -- dense-analysis/ale
    if opt.plugins.ale then
        d.ALEError = { link = 'ErrorText' }
        d.ALEWarning = { link = 'WarningText' }
        d.ALEInfo = { link = 'InfoText' }
        d.ALEErrorSign = { link = 'RedSign' }
        d.ALEWarningSign = { link = 'YellowSign' }
        d.ALEInfoSign = { link = 'BlueSign' }
        d.ALEErrorLine = { link = 'ErrorLine' }
        d.ALEWarningLine = { link = 'WarningLine' }
        d.ALEInfoLine = { link = 'InfoLine' }
        d.ALEVirtualTextError = { link = 'Red' }
        d.ALEVirtualTextWarning = { link = 'Yellow' }
        d.ALEVirtualTextInfo = { link = 'Blue' }
        d.ALEVirtualTextStyleError = { link = 'Green' }
        d.ALEVirtualTextStyleWarning = { link = 'Green' }
    end

    -- nvim-telescope/telescope.nvim
    if opt.plugins.telescope then
        d.TelescopeMatching = { link = 'Title' }
        d.TelescopeBorder = { link = 'Grey' }
        d.TelescopePromptPrefix = { link = 'Fg' }
        d.TelescopeSelection = { link = 'Visual' }
        d.TelescopeResultsDiffAdd = { link = 'GreenSign' }
        d.TelescopeResultsDiffChange = { link = 'BlueSign' }
        d.TelescopeResultsDiffDelete = { link = 'RedSign' }
        d.TelescopeResultsDiffUntracked = { link = 'YellowSign' }
    end

    -- airblade/vim-gitgutter
    if opt.plugins['git-gutter'] then
        d.GitGutterAdd = { link = 'GreenSign' }
        d.GitGutterChange = { link = 'BlueSign' }
        d.GitGutterDelete = { link = 'RedSign' }
        d.GitGutterChangeDelete = { link = 'PurpleSign' }
    end

    -- easymotion/vim-easymotion
    if opt.plugins.easymotion then
        d.EasyMotionTarget = { link = 'Search' }
        d.EasyMotionShade = { link = 'Grey' }
    end

    -- justinmk/vim-sneak
    if opt.plugins['vim-sneak'] then
        d.SneakLabelMask = { fg = colors.bg_green, bg = colors.bg_green }
        d.Sneak = { link = 'Search' }
        d.SneakLabel = { link = 'Search' }
        d.SneakScope = { link = 'DiffText' }
    end

    -- vim-plug
    if opt.plugins['vim-plug'] then
        d.plug1 = { fg = colors.orange, gui = 'bold' }
        d.plugNumber = { fg = colors.yellow, gui = 'bold' }
        d.plug2 = { link = 'Green' }
        d.plugBracket = { link = 'Grey' }
        d.plugName = { link = 'Aqua' }
        d.plugDash = { link = 'Orange' }
        d.plugError = { link = 'Red' }
        d.plugNotLoaded = { link = 'Grey' }
        d.plugRelDate = { link = 'Grey' }
        d.plugH2 = { link = 'Orange' }
        d.plugMessage = { link = 'Orange' }
        d.plugStar = { link = 'Red' }
        d.plugUpdate = { link = 'Blue' }
        d.plugDeleted = { link = 'Grey' }
        d.plugEdge = { link = 'Yellow' }
        d.plugSha = { link = 'Green' }
    end

    -- preservim/nerdtree
    if opt.plugins.nerdtree then
        d.NERDTreeDir = { link = 'Green' }
        d.NERDTreeDirSlash = { link = 'Aqua' }
        d.NERDTreeOpenable = { link = 'Orange' }
        d.NERDTreeClosable = { link = 'Orange' }
        d.NERDTreeFile = { link = 'Fg' }
        d.NERDTreeExecFile = { link = 'Yellow' }
        d.NERDTreeUp = { link = 'Grey' }
        d.NERDTreeCWD = { link = 'Aqua' }
        d.NERDTreeHelp = { link = 'LightGrey' }
        d.NERDTreeToggleOn = { link = 'Green' }
        d.NERDTreeToggleOff = { link = 'Red' }
        d.NERDTreeFlags = { link = 'Orange' }
        d.NERDTreeLinkFile = { link = 'Grey' }
        d.NERDTreeLinkTarget = { link = 'Green' }
    end

    -- mhinz/vim-startify
    if opt.plugins['vim-startify'] then
        d.StartifyBracket = { link = 'Grey' }
        d.StartifyFile = { link = 'Fg' }
        d.StartifyNumber = { link = 'Red' }
        d.StartifyPath = { link = 'Green' }
        d.StartifySlash = { link = 'Green' }
        d.StartifySection = { link = 'Blue' }
        d.StartifyHeader = { link = 'Orange' }
        d.StartifySpecial = { link = 'Grey' }
        d.StartifyFooter = { link = 'Grey' }
    end

    -- phaazon/hop.nvim
    if opt.plugins['hop.nvim'] then
        d.HopNextKey = { link = 'NormalInverse' }
        d.HopNextKey1 = { link = 'NormalInverse' }
        d.HopNextKey2 = { link = 'NormalInverse' }
        d.HopUnmatched = { fg = colors.bg5 }
    end

    -- kyazdani42/nvim-tree.lua
    if opt.plugins['nvim-tree'] then
        d.NvimTreeFolderName = { link = 'Fg' }
        d.NvimTreeFolderIcon = { link = 'Fg' }
        d.NvimTreeIndentMarker = { link = 'Whitespace' }
        d.NvimTreeOpenedFile = { link = 'Fg' }
        d.NvimTreeOpenedFolderName = { link = 'Fg' }
        d.NvimTreeRootFolder = { fg = colors.grey1, gui = 'bold' }
        d.NvimTreeExecFile = { link = 'FgBold' }
        d.NvimTreeSpecialFile = { link = 'Fg' }
    end

    -- lewis6991/gitsigns.nvim
    if opt.plugins.gitsigns then
        d.GitSignsAdd = { link = 'GreenSign' }
        d.GitSignsChange = { link = 'BlueSign' }
        d.GitSignsDelete = { link = 'RedSign' }
    end
    -- ####### Plugins: End

    return d
end

function definitions.filetypes(_, colors)
    local d = {}

    -- ####### Extended filetype: Start
    -- diff
    d.diffAdded = { link = 'Green' }
    d.diffRemoved = { link = 'Red' }
    d.diffChanged = { link = 'Blue' }
    d.diffOldFile = { link = 'Yellow' }
    d.diffNewFile = { link = 'Orange' }
    d.diffFile = { link = 'Aqua' }
    d.diffLine = { link = 'Grey' }
    d.diffIndexLine = { link = 'Purple' }
    -- netrw
    d.netrwDir = { link = 'Green' }
    d.netrwClassify = { link = 'Green' }
    d.netrwLink = { link = 'Grey' }
    d.netrwSymLink = { link = 'Fg' }
    d.netrwExe = { link = 'Yellow' }
    d.netrwComment = { link = 'Grey' }
    d.netrwList = { link = 'Aqua' }
    d.netrwHelpCmd = { link = 'Blue' }
    d.netrwCmdSep = { link = 'Grey' }
    d.netrwVersion = { link = 'Orange' }
    -- markdown
    d.markdownH1 = { fg = colors.red, gui = 'bold' }
    d.markdownH2 = { fg = colors.orange, gui = 'bold' }
    d.markdownH3 = { fg = colors.yellow, gui = 'bold' }
    d.markdownH4 = { fg = colors.green, gui = 'bold' }
    d.markdownH5 = { fg = colors.blue, gui = 'bold' }
    d.markdownH6 = { fg = colors.purple, gui = 'bold' }
    d.markdownUrl = { fg = colors.blue, gui = 'underline' }
    d.markdownItalic = { gui = 'italic' }
    d.markdownBold = { gui = 'bold' }
    d.markdownItalicDelimiter = { fg = colors.grey1, gui = 'italic' }
    d.markdownCode = { link = 'Green' }
    d.markdownCodeBlock = { link = 'Aqua' }
    d.markdownCodeDelimiter = { link = 'Aqua' }
    d.markdownBlockquote = { link = 'Grey' }
    d.markdownListMarker = { link = 'Red' }
    d.markdownOrderedListMarker = { link = 'Red' }
    d.markdownRule = { link = 'Purple' }
    d.markdownHeadingRule = { link = 'Grey' }
    d.markdownUrlDelimiter = { link = 'Grey' }
    d.markdownLinkDelimiter = { link = 'Grey' }
    d.markdownLinkTextDelimiter = { link = 'Grey' }
    d.markdownHeadingDelimiter = { link = 'Grey' }
    d.markdownLinkText = { link = 'Purple' }
    d.markdownUrlTitleDelimiter = { link = 'Green' }
    d.markdownIdDeclaration = { link = 'markdownLinkText' }
    d.markdownBoldDelimiter = { link = 'Grey' }
    d.markdownId = { link = 'Yellow' }
    -- html/markdown/javascriptreact/typescriptreact
    d.htmlH1 = { fg = colors.red, gui = 'bold' }
    d.htmlH2 = { fg = colors.orange, gui = 'bold' }
    d.htmlH3 = { fg = colors.yellow, gui = 'bold' }
    d.htmlH4 = { fg = colors.green, gui = 'bold' }
    d.htmlH5 = { fg = colors.blue, gui = 'bold' }
    d.htmlH6 = { fg = colors.purple, gui = 'bold' }
    d.htmlLink = { gui = 'underline' }
    d.htmlBold = { gui = 'bold' }
    d.htmlBoldUnderline = { gui = 'bold,underline' }
    d.htmlBoldItalic = { gui = 'bold,italic' }
    d.htmlBoldUnderlineItalic = { gui = 'bold,underline,italic' }
    d.htmlUnderline = { gui = 'underline' }
    d.htmlUnderlineItalic = { gui = 'underline,italic' }
    d.htmlItalic = { gui = 'italic' }
    d.htmlTag = { link = 'Green' }
    d.htmlEndTag = { link = 'Blue' }
    d.htmlTagN = { link = 'OrangeItalic' }
    d.htmlTagName = { link = 'OrangeItalic' }
    d.htmlArg = { link = 'Aqua' }
    d.htmlScriptTag = { link = 'Purple' }
    d.htmlSpecialTagName = { link = 'RedItalic' }
    -- xml
    d.xmlTag = { link = 'Green' }
    d.xmlEndTag = { link = 'Blue' }
    d.xmlTagName = { link = 'OrangeItalic' }
    d.xmlEqual = { link = 'Orange' }
    d.xmlAttrib = { link = 'Aqua' }
    d.xmlEntity = { link = 'Red' }
    d.xmlEntityPunct = { link = 'Red' }
    d.xmlDocTypeDecl = { link = 'Grey' }
    d.xmlDocTypeKeyword = { link = 'PurpleItalic' }
    d.xmlCdataStart = { link = 'Grey' }
    d.xmlCdataCdata = { link = 'Purple' }
    -- css/scss/sass/less
    d.cssAttrComma = { link = 'Fg' }
    d.cssBraces = { link = 'Fg' }
    d.cssTagName = { link = 'PurpleItalic' }
    d.cssClassNameDot = { link = 'Red' }
    d.cssClassName = { link = 'RedItalic' }
    d.cssFunctionName = { link = 'Yellow' }
    d.cssAttr = { link = 'Orange' }
    d.cssProp = { link = 'Aqua' }
    d.cssCommonAttr = { link = 'Yellow' }
    d.cssPseudoClassId = { link = 'Blue' }
    d.cssPseudoClassFn = { link = 'Green' }
    d.cssPseudoClass = { link = 'Purple' }
    d.cssImportant = { link = 'RedItalic' }
    d.cssSelectorOp = { link = 'Orange' }
    d.cssSelectorOp2 = { link = 'Orange' }
    d.cssColor = { link = 'Green' }
    d.cssAttributeSelector = { link = 'Aqua' }
    d.cssUnitDecorators = { link = 'Orange' }
    d.cssValueLength = { link = 'Green' }
    d.cssValueInteger = { link = 'Green' }
    d.cssValueNumber = { link = 'Green' }
    d.cssValueAngle = { link = 'Green' }
    d.cssValueTime = { link = 'Green' }
    d.cssValueFrequency = { link = 'Green' }
    d.cssVendor = { link = 'Grey' }
    d.cssNoise = { link = 'Grey' }
    d.scssMixinName = { link = 'Yellow' }
    d.scssSelectorChar = { link = 'Red' }
    d.scssSelectorName = { link = 'RedItalic' }
    d.scssInterpolationDelimiter = { link = 'Green' }
    d.scssVariableValue = { link = 'Green' }
    d.scssNull = { link = 'Purple' }
    d.scssBoolean = { link = 'Purple' }
    d.scssVariableAssignment = { link = 'Grey' }
    d.scssForKeyword = { link = 'PurpleItalic' }
    d.scssAttribute = { link = 'Orange' }
    d.scssFunctionName = { link = 'Yellow' }
    d.sassProperty = { link = 'Aqua' }
    d.sassAmpersand = { link = 'Orange' }
    d.sassClass = { link = 'RedItalic' }
    d.sassClassChar = { link = 'Red' }
    d.sassMixing = { link = 'PurpleItalic' }
    d.sassMixinName = { link = 'Orange' }
    d.sassCssAttribute = { link = 'Yellow' }
    d.sassInterpolationDelimiter = { link = 'Green' }
    d.sassFunction = { link = 'Yellow' }
    d.sassControl = { link = 'RedItalic' }
    d.sassFor = { link = 'RedItalic' }
    d.sassFunctionName = { link = 'GreenBold' }
    -- less
    d.lessMixinChar = { link = 'Grey' }
    d.lessClass = { link = 'RedItalic' }
    d.lessVariable = { link = 'Blue' }
    d.lessAmpersandChar = { link = 'Orange' }
    d.lessFunction = { link = 'Yellow' }
    -- javascript/javascriptreact
    d.javaScriptNull = { link = 'Aqua' }
    d.javaScriptIdentifier = { link = 'Orange' }
    d.javaScriptParens = { link = 'Fg' }
    d.javaScriptBraces = { link = 'Fg' }
    d.javaScriptGlobal = { link = 'Purple' }
    d.javaScriptMessage = { link = 'Yellow' }
    d.javaScriptFunction = { link = 'RedItalic' }
    d.javaScriptOperator = { link = 'Orange' }
    d.javaScriptMember = { link = 'Aqua' }
    -- vim-javascript: https://github.com/pangloss/vim-javascript
    d.jsThis = { link = 'Purple' }
    d.jsUndefined = { link = 'Aqua' }
    d.jsNull = { link = 'Aqua' }
    d.jsNan = { link = 'Aqua' }
    d.jsSuper = { link = 'Purple' }
    d.jsPrototype = { link = 'Purple' }
    d.jsFunction = { link = 'RedItalic' }
    d.jsGlobalNodeObjects = { link = 'PurpleItalic' }
    d.jsGlobalObjects = { link = 'Yellow' }
    d.jsArrowFunction = { link = 'Purple' }
    d.jsArrowFuncArgs = { link = 'Blue' }
    d.jsFuncArgs = { link = 'Blue' }
    d.jsObjectProp = { link = 'Aqua' }
    d.jsVariableDef = { link = 'Blue' }
    d.jsObjectKey = { link = 'Aqua' }
    d.jsParen = { link = 'Blue' }
    d.jsParenIfElse = { link = 'Blue' }
    d.jsParenRepeat = { link = 'Blue' }
    d.jsParenSwitch = { link = 'Blue' }
    d.jsParenCatch = { link = 'Blue' }
    d.jsBracket = { link = 'Blue' }
    d.jsBlockLabel = { link = 'Aqua' }
    d.jsFunctionKey = { link = 'GreenBold' }
    d.jsClassDefinition = { link = 'Yellow' }
    d.jsDot = { link = 'Grey' }
    d.jsDestructuringBlock = { link = 'Blue' }
    d.jsSpreadExpression = { link = 'Purple' }
    d.jsSpreadOperator = { link = 'Green' }
    d.jsModuleKeyword = { link = 'Yellow' }
    d.jsObjectValue = { link = 'Blue' }
    d.jsTemplateExpression = { link = 'Yellow' }
    d.jsTemplateBraces = { link = 'Yellow' }
    d.jsClassMethodType = { link = 'Orange' }
    -- yajs: https://github.com/othree/yajs.vim
    d.javascriptEndColons = { link = 'Fg' }
    d.javascriptOpSymbol = { link = 'Orange' }
    d.javascriptOpSymbols = { link = 'Orange' }
    d.javascriptIdentifierName = { link = 'Blue' }
    d.javascriptVariable = { link = 'Orange' }
    d.javascriptObjectLabel = { link = 'Aqua' }
    d.javascriptObjectLabelColon = { link = 'Grey' }
    d.javascriptPropertyNameString = { link = 'Aqua' }
    d.javascriptFuncArg = { link = 'Blue' }
    d.javascriptIdentifier = { link = 'Purple' }
    d.javascriptArrowFunc = { link = 'Purple' }
    d.javascriptTemplate = { link = 'Yellow' }
    d.javascriptTemplateSubstitution = { link = 'Yellow' }
    d.javascriptTemplateSB = { link = 'Yellow' }
    d.javascriptNodeGlobal = { link = 'PurpleItalic' }
    d.javascriptDocTags = { link = 'PurpleItalic' }
    d.javascriptDocNotation = { link = 'Purple' }
    d.javascriptClassSuper = { link = 'Purple' }
    d.javascriptClassName = { link = 'Yellow' }
    d.javascriptClassSuperName = { link = 'Yellow' }
    d.javascriptBrackets = { link = 'Fg' }
    d.javascriptBraces = { link = 'Fg' }
    d.javascriptLabel = { link = 'Purple' }
    d.javascriptDotNotation = { link = 'Grey' }
    d.javascriptGlobalArrayDot = { link = 'Grey' }
    d.javascriptGlobalBigIntDot = { link = 'Grey' }
    d.javascriptGlobalDateDot = { link = 'Grey' }
    d.javascriptGlobalJSONDot = { link = 'Grey' }
    d.javascriptGlobalMathDot = { link = 'Grey' }
    d.javascriptGlobalNumberDot = { link = 'Grey' }
    d.javascriptGlobalObjectDot = { link = 'Grey' }
    d.javascriptGlobalPromiseDot = { link = 'Grey' }
    d.javascriptGlobalRegExpDot = { link = 'Grey' }
    d.javascriptGlobalStringDot = { link = 'Grey' }
    d.javascriptGlobalSymbolDot = { link = 'Grey' }
    d.javascriptGlobalURLDot = { link = 'Grey' }
    d.javascriptMethod = { link = 'GreenBold' }
    d.javascriptMethodName = { link = 'GreenBold' }
    d.javascriptObjectMethodName = { link = 'GreenBold' }
    d.javascriptGlobalMethod = { link = 'GreenBold' }
    d.javascriptDOMStorageMethod = { link = 'GreenBold' }
    d.javascriptFileMethod = { link = 'GreenBold' }
    d.javascriptFileReaderMethod = { link = 'GreenBold' }
    d.javascriptFileListMethod = { link = 'GreenBold' }
    d.javascriptBlobMethod = { link = 'GreenBold' }
    d.javascriptURLStaticMethod = { link = 'GreenBold' }
    d.javascriptNumberStaticMethod = { link = 'GreenBold' }
    d.javascriptNumberMethod = { link = 'GreenBold' }
    d.javascriptDOMNodeMethod = { link = 'GreenBold' }
    d.javascriptES6BigIntStaticMethod = { link = 'GreenBold' }
    d.javascriptBOMWindowMethod = { link = 'GreenBold' }
    d.javascriptHeadersMethod = { link = 'GreenBold' }
    d.javascriptRequestMethod = { link = 'GreenBold' }
    d.javascriptResponseMethod = { link = 'GreenBold' }
    d.javascriptES6SetMethod = { link = 'GreenBold' }
    d.javascriptReflectMethod = { link = 'GreenBold' }
    d.javascriptPaymentMethod = { link = 'GreenBold' }
    d.javascriptPaymentResponseMethod = { link = 'GreenBold' }
    d.javascriptTypedArrayStaticMethod = { link = 'GreenBold' }
    d.javascriptGeolocationMethod = { link = 'GreenBold' }
    d.javascriptES6MapMethod = { link = 'GreenBold' }
    d.javascriptServiceWorkerMethod = { link = 'GreenBold' }
    d.javascriptCacheMethod = { link = 'GreenBold' }
    d.javascriptFunctionMethod = { link = 'GreenBold' }
    d.javascriptXHRMethod = { link = 'GreenBold' }
    d.javascriptBOMNavigatorMethod = { link = 'GreenBold' }
    d.javascriptDOMEventTargetMethod = { link = 'GreenBold' }
    d.javascriptDOMEventMethod = { link = 'GreenBold' }
    d.javascriptIntlMethod = { link = 'GreenBold' }
    d.javascriptDOMDocMethod = { link = 'GreenBold' }
    d.javascriptStringStaticMethod = { link = 'GreenBold' }
    d.javascriptStringMethod = { link = 'GreenBold' }
    d.javascriptSymbolStaticMethod = { link = 'GreenBold' }
    d.javascriptRegExpMethod = { link = 'GreenBold' }
    d.javascriptObjectStaticMethod = { link = 'GreenBold' }
    d.javascriptObjectMethod = { link = 'GreenBold' }
    d.javascriptBOMLocationMethod = { link = 'GreenBold' }
    d.javascriptJSONStaticMethod = { link = 'GreenBold' }
    d.javascriptGeneratorMethod = { link = 'GreenBold' }
    d.javascriptEncodingMethod = { link = 'GreenBold' }
    d.javascriptPromiseStaticMethod = { link = 'GreenBold' }
    d.javascriptPromiseMethod = { link = 'GreenBold' }
    d.javascriptBOMHistoryMethod = { link = 'GreenBold' }
    d.javascriptDOMFormMethod = { link = 'GreenBold' }
    d.javascriptClipboardMethod = { link = 'GreenBold' }
    d.javascriptBroadcastMethod = { link = 'GreenBold' }
    d.javascriptDateStaticMethod = { link = 'GreenBold' }
    d.javascriptDateMethod = { link = 'GreenBold' }
    d.javascriptConsoleMethod = { link = 'GreenBold' }
    d.javascriptArrayStaticMethod = { link = 'GreenBold' }
    d.javascriptArrayMethod = { link = 'GreenBold' }
    d.javascriptMathStaticMethod = { link = 'GreenBold' }
    d.javascriptSubtleCryptoMethod = { link = 'GreenBold' }
    d.javascriptCryptoMethod = { link = 'GreenBold' }
    d.javascriptProp = { link = 'Aqua' }
    d.javascriptBOMWindowProp = { link = 'Aqua' }
    d.javascriptDOMStorageProp = { link = 'Aqua' }
    d.javascriptFileReaderProp = { link = 'Aqua' }
    d.javascriptURLUtilsProp = { link = 'Aqua' }
    d.javascriptNumberStaticProp = { link = 'Aqua' }
    d.javascriptDOMNodeProp = { link = 'Aqua' }
    d.javascriptRequestProp = { link = 'Aqua' }
    d.javascriptResponseProp = { link = 'Aqua' }
    d.javascriptES6SetProp = { link = 'Aqua' }
    d.javascriptPaymentProp = { link = 'Aqua' }
    d.javascriptPaymentResponseProp = { link = 'Aqua' }
    d.javascriptPaymentAddressProp = { link = 'Aqua' }
    d.javascriptPaymentShippingOptionProp = { link = 'Aqua' }
    d.javascriptTypedArrayStaticProp = { link = 'Aqua' }
    d.javascriptServiceWorkerProp = { link = 'Aqua' }
    d.javascriptES6MapProp = { link = 'Aqua' }
    d.javascriptRegExpStaticProp = { link = 'Aqua' }
    d.javascriptRegExpProp = { link = 'Aqua' }
    d.javascriptXHRProp = { link = 'Aqua' }
    d.javascriptBOMNavigatorProp = { link = 'GreenBold' }
    d.javascriptDOMEventProp = { link = 'Aqua' }
    d.javascriptBOMNetworkProp = { link = 'Aqua' }
    d.javascriptDOMDocProp = { link = 'Aqua' }
    d.javascriptSymbolStaticProp = { link = 'Aqua' }
    d.javascriptSymbolProp = { link = 'Aqua' }
    d.javascriptBOMLocationProp = { link = 'Aqua' }
    d.javascriptEncodingProp = { link = 'Aqua' }
    d.javascriptCryptoProp = { link = 'Aqua' }
    d.javascriptBOMHistoryProp = { link = 'Aqua' }
    d.javascriptDOMFormProp = { link = 'Aqua' }
    d.javascriptDataViewProp = { link = 'Aqua' }
    d.javascriptBroadcastProp = { link = 'Aqua' }
    d.javascriptMathStaticProp = { link = 'Aqua' }
    -- vim-jsx-pretty: https://github.com/maxmellon/vim-jsx-pretty
    d.jsxTagName = { link = 'OrangeItalic' }
    d.jsxOpenPunct = { link = 'Green' }
    d.jsxClosePunct = { link = 'Blue' }
    d.jsxEscapeJs = { link = 'Blue' }
    d.jsxAttrib = { link = 'Aqua' }
    -- typescript/typescriptreact
    -- vim-typescript: https://github.com/leafgarland/typescript-vim
    d.typescriptSource = { link = 'PurpleItalic' }
    d.typescriptMessage = { link = 'Yellow' }
    d.typescriptGlobalObjects = { link = 'Aqua' }
    d.typescriptInterpolation = { link = 'Yellow' }
    d.typescriptInterpolationDelimiter = { link = 'Yellow' }
    d.typescriptBraces = { link = 'Fg' }
    d.typescriptParens = { link = 'Fg' }
    -- yats: https:github.com/HerringtonDarkholme/yats.vim
    d.typescriptMethodAccessor = { link = 'OrangeItalic' }
    d.typescriptVariable = { link = 'Orange' }
    d.typescriptVariableDeclaration = { link = 'Blue' }
    d.typescriptTypeReference = { link = 'Yellow' }
    d.typescriptEnumKeyword = { link = 'RedItalic' }
    d.typescriptEnum = { link = 'Yellow' }
    d.typescriptIdentifierName = { link = 'Aqua' }
    d.typescriptProp = { link = 'Aqua' }
    d.typescriptCall = { link = 'Blue' }
    d.typescriptInterfaceName = { link = 'Yellow' }
    d.typescriptEndColons = { link = 'Fg' }
    d.typescriptMember = { link = 'Aqua' }
    d.typescriptMemberOptionality = { link = 'Orange' }
    d.typescriptObjectLabel = { link = 'Aqua' }
    d.typescriptArrowFunc = { link = 'Purple' }
    d.typescriptAbstract = { link = 'Orange' }
    d.typescriptObjectColon = { link = 'Grey' }
    d.typescriptTypeAnnotation = { link = 'Grey' }
    d.typescriptAssign = { link = 'Orange' }
    d.typescriptBinaryOp = { link = 'Orange' }
    d.typescriptUnaryOp = { link = 'Orange' }
    d.typescriptFuncComma = { link = 'Fg' }
    d.typescriptClassName = { link = 'Yellow' }
    d.typescriptClassHeritage = { link = 'Yellow' }
    d.typescriptInterfaceHeritage = { link = 'Yellow' }
    d.typescriptIdentifier = { link = 'Purple' }
    d.typescriptGlobal = { link = 'Purple' }
    d.typescriptOperator = { link = 'RedItalic' }
    d.typescriptNodeGlobal = { link = 'PurpleItalic' }
    d.typescriptExport = { link = 'PurpleItalic' }
    d.typescriptDefaultParam = { link = 'Orange' }
    d.typescriptImport = { link = 'PurpleItalic' }
    d.typescriptTypeParameter = { link = 'Yellow' }
    d.typescriptReadonlyModifier = { link = 'Orange' }
    d.typescriptAccessibilityModifier = { link = 'Orange' }
    d.typescriptAmbientDeclaration = { link = 'RedItalic' }
    d.typescriptTemplateSubstitution = { link = 'Yellow' }
    d.typescriptTemplateSB = { link = 'Yellow' }
    d.typescriptExceptions = { link = 'RedItalic' }
    d.typescriptCastKeyword = { link = 'RedItalic' }
    d.typescriptOptionalMark = { link = 'Orange' }
    d.typescriptNull = { link = 'Aqua' }
    d.typescriptMappedIn = { link = 'RedItalic' }
    d.typescriptFuncTypeArrow = { link = 'Purple' }
    d.typescriptTernaryOp = { link = 'Orange' }
    d.typescriptParenExp = { link = 'Blue' }
    d.typescriptIndexExpr = { link = 'Blue' }
    d.typescriptDotNotation = { link = 'Grey' }
    d.typescriptGlobalNumberDot = { link = 'Grey' }
    d.typescriptGlobalStringDot = { link = 'Grey' }
    d.typescriptGlobalArrayDot = { link = 'Grey' }
    d.typescriptGlobalObjectDot = { link = 'Grey' }
    d.typescriptGlobalSymbolDot = { link = 'Grey' }
    d.typescriptGlobalMathDot = { link = 'Grey' }
    d.typescriptGlobalDateDot = { link = 'Grey' }
    d.typescriptGlobalJSONDot = { link = 'Grey' }
    d.typescriptGlobalRegExpDot = { link = 'Grey' }
    d.typescriptGlobalPromiseDot = { link = 'Grey' }
    d.typescriptGlobalURLDot = { link = 'Grey' }
    d.typescriptGlobalMethod = { link = 'GreenBold' }
    d.typescriptDOMStorageMethod = { link = 'GreenBold' }
    d.typescriptFileMethod = { link = 'GreenBold' }
    d.typescriptFileReaderMethod = { link = 'GreenBold' }
    d.typescriptFileListMethod = { link = 'GreenBold' }
    d.typescriptBlobMethod = { link = 'GreenBold' }
    d.typescriptURLStaticMethod = { link = 'GreenBold' }
    d.typescriptNumberStaticMethod = { link = 'GreenBold' }
    d.typescriptNumberMethod = { link = 'GreenBold' }
    d.typescriptDOMNodeMethod = { link = 'GreenBold' }
    d.typescriptPaymentMethod = { link = 'GreenBold' }
    d.typescriptPaymentResponseMethod = { link = 'GreenBold' }
    d.typescriptHeadersMethod = { link = 'GreenBold' }
    d.typescriptRequestMethod = { link = 'GreenBold' }
    d.typescriptResponseMethod = { link = 'GreenBold' }
    d.typescriptES6SetMethod = { link = 'GreenBold' }
    d.typescriptReflectMethod = { link = 'GreenBold' }
    d.typescriptBOMWindowMethod = { link = 'GreenBold' }
    d.typescriptGeolocationMethod = { link = 'GreenBold' }
    d.typescriptServiceWorkerMethod = { link = 'GreenBold' }
    d.typescriptCacheMethod = { link = 'GreenBold' }
    d.typescriptES6MapMethod = { link = 'GreenBold' }
    d.typescriptFunctionMethod = { link = 'GreenBold' }
    d.typescriptRegExpMethod = { link = 'GreenBold' }
    d.typescriptXHRMethod = { link = 'GreenBold' }
    d.typescriptBOMNavigatorMethod = { link = 'GreenBold' }
    d.typescriptIntlMethod = { link = 'GreenBold' }
    d.typescriptDOMEventTargetMethod = { link = 'GreenBold' }
    d.typescriptDOMEventMethod = { link = 'GreenBold' }
    d.typescriptDOMDocMethod = { link = 'GreenBold' }
    d.typescriptStringStaticMethod = { link = 'GreenBold' }
    d.typescriptStringMethod = { link = 'GreenBold' }
    d.typescriptSymbolStaticMethod = { link = 'GreenBold' }
    d.typescriptObjectStaticMethod = { link = 'GreenBold' }
    d.typescriptObjectMethod = { link = 'GreenBold' }
    d.typescriptJSONStaticMethod = { link = 'GreenBold' }
    d.typescriptEncodingMethod = { link = 'GreenBold' }
    d.typescriptBOMLocationMethod = { link = 'GreenBold' }
    d.typescriptPromiseStaticMethod = { link = 'GreenBold' }
    d.typescriptPromiseMethod = { link = 'GreenBold' }
    d.typescriptSubtleCryptoMethod = { link = 'GreenBold' }
    d.typescriptCryptoMethod = { link = 'GreenBold' }
    d.typescriptBOMHistoryMethod = { link = 'GreenBold' }
    d.typescriptDOMFormMethod = { link = 'GreenBold' }
    d.typescriptConsoleMethod = { link = 'GreenBold' }
    d.typescriptDateStaticMethod = { link = 'GreenBold' }
    d.typescriptDateMethod = { link = 'GreenBold' }
    d.typescriptArrayStaticMethod = { link = 'GreenBold' }
    d.typescriptArrayMethod = { link = 'GreenBold' }
    d.typescriptMathStaticMethod = { link = 'GreenBold' }
    d.typescriptStringProperty = { link = 'Aqua' }
    d.typescriptDOMStorageProp = { link = 'Aqua' }
    d.typescriptFileReaderProp = { link = 'Aqua' }
    d.typescriptURLUtilsProp = { link = 'Aqua' }
    d.typescriptNumberStaticProp = { link = 'Aqua' }
    d.typescriptDOMNodeProp = { link = 'Aqua' }
    d.typescriptBOMWindowProp = { link = 'Aqua' }
    d.typescriptRequestProp = { link = 'Aqua' }
    d.typescriptResponseProp = { link = 'Aqua' }
    d.typescriptPaymentProp = { link = 'Aqua' }
    d.typescriptPaymentResponseProp = { link = 'Aqua' }
    d.typescriptPaymentAddressProp = { link = 'Aqua' }
    d.typescriptPaymentShippingOptionProp = { link = 'Aqua' }
    d.typescriptES6SetProp = { link = 'Aqua' }
    d.typescriptServiceWorkerProp = { link = 'Aqua' }
    d.typescriptES6MapProp = { link = 'Aqua' }
    d.typescriptRegExpStaticProp = { link = 'Aqua' }
    d.typescriptRegExpProp = { link = 'Aqua' }
    d.typescriptBOMNavigatorProp = { link = 'GreenBold' }
    d.typescriptXHRProp = { link = 'Aqua' }
    d.typescriptDOMEventProp = { link = 'Aqua' }
    d.typescriptDOMDocProp = { link = 'Aqua' }
    d.typescriptBOMNetworkProp = { link = 'Aqua' }
    d.typescriptSymbolStaticProp = { link = 'Aqua' }
    d.typescriptEncodingProp = { link = 'Aqua' }
    d.typescriptBOMLocationProp = { link = 'Aqua' }
    d.typescriptCryptoProp = { link = 'Aqua' }
    d.typescriptDOMFormProp = { link = 'Aqua' }
    d.typescriptBOMHistoryProp = { link = 'Aqua' }
    d.typescriptMathStaticProp = { link = 'Aqua' }
    -- dart
    -- dart-lang: https://github.com/dart-lang/dart-vim-plugin
    d.dartCoreClasses = { link = 'Aqua' }
    d.dartTypeName = { link = 'Aqua' }
    d.dartInterpolation = { link = 'Blue' }
    d.dartTypeDef = { link = 'RedItalic' }
    d.dartClassDecl = { link = 'RedItalic' }
    d.dartLibrary = { link = 'PurpleItalic' }
    d.dartMetadata = { link = 'Blue' }
    -- coffee
    -- vim-coffee-script: https://github.com/kchmck/vim-coffee-script
    -- d.coffeeExtendedOp = {link = "Orange"}
    -- d.coffeeSpecialOp = {link = "Fg"}
    -- d.coffeeDotAccess = {link = "Grey"}
    -- d.coffeeCurly = {link = "Fg"}
    -- d.coffeeParen = {link = "Fg"}
    -- d.coffeeBracket = {link = "Fg"}
    -- d.coffeeParens = {link = "Blue"}
    -- d.coffeeBrackets = {link = "Blue"}
    -- d.coffeeCurlies = {link = "Blue"}
    -- d.coffeeOperator = {link = "RedItalic"}
    -- d.coffeeStatement = {link = "Orange"}
    -- d.coffeeSpecialIdent = {link = "Purple"}
    -- d.coffeeObject = {link = "Purple"}
    -- d.coffeeObjAssign = {link = "Aqua"}
    -- purescript
    -- purescript-vim: https://github.com/purescript-contrib/purescript-vim
    -- d.purescriptModuleKeyword = {link = "PurpleItalic"}
    -- d.purescriptModule = {link = "Aqua"}
    -- d.purescriptModuleParams = {link = "Blue"}
    -- d.purescriptAsKeyword = {link = "OrangeItalic"}
    -- d.purescriptHidingKeyword = {link = "OrangeItalic"}
    -- d.purescriptWhere = {link = "OrangeItalic"}
    -- d.purescriptIdentifier = {link = "Blue"}
    -- d.purescriptFunction = {link = "Yellow"}
    -- d.purescriptType = {link = "Aqua"}
    -- c/cpp/objc/objcpp
    -- vim-cpp-enhanced-highlight: https://github.com/octol/vim-cpp-enhanced-highlight
    d.cppSTLnamespace = { link = 'Purple' }
    d.cppSTLtype = { link = 'Yellow' }
    d.cppAccess = { link = 'PurpleItalic' }
    d.cppStructure = { link = 'RedItalic' }
    d.cppSTLios = { link = 'Aqua' }
    d.cppSTLiterator = { link = 'PurpleItalic' }
    d.cppSTLexception = { link = 'Purple' }
    d.cppSTLVariable = { link = 'Aqua' }
    -- chromatica: https://github.com/arakashic/chromatica.nvim
    -- d.Member = {link = "Aqua"}
    -- d.Variable = {link = "Blue"}
    -- d.Namespace = {link = "Purple"}
    -- d.EnumConstant = {link = "Aqua"}
    -- d.chromaticaException = {link = "RedItalic"}
    -- d.chromaticaCast = {link = "Orange"}
    -- d.OperatorOverload = {link = "Orange"}
    -- d.AccessQual = {link = "Orange"}
    -- d.Linkage = {link = "Orange"}
    -- d.AutoType = {link = "Yellow"}
    -- vim-lsp-cxx-highlight https://github.com/jackguo380/vim-lsp-cxx-highlight
    -- d.LspCxxHlSkippedRegion = {link = "Grey"}
    -- d.LspCxxHlSkippedRegionBeginEnd = {link = "PurpleItalic"}
    -- d.LspCxxHlGroupEnumConstant = {link = "Aqua"}
    -- d.LspCxxHlGroupNamespace = {link = "Purple"}
    -- d.LspCxxHlGroupMemberVariable = {link = "Aqua"}
    -- objc
    d.objcTypeModifier = { link = 'Blue' }
    d.objcModuleImport = { link = 'PurpleItalic' }
    d.objcException = { link = 'RedItalic' }
    d.objcProtocolList = { link = 'Aqua' }
    d.objcObjDef = { link = 'PurpleItalic' }
    d.objcDirective = { link = 'RedItalic' }
    d.objcPropertyAttribute = { link = 'Orange' }
    d.objcHiddenArgument = { link = 'Aqua' }
    -- csharp
    -- builtin: https://github.com/nickspoons/vim-cs
    d.csUnspecifiedStatement = { link = 'PurpleItalic' }
    d.csStorage = { link = 'RedItalic' }
    d.csClass = { link = 'RedItalic' }
    d.csNewType = { link = 'Aqua' }
    d.csContextualStatement = { link = 'PurpleItalic' }
    d.csInterpolationDelimiter = { link = 'Yellow' }
    d.csInterpolation = { link = 'Yellow' }
    d.csEndColon = { link = 'Fg' }
    -- python
    d.pythonBuiltin = { link = 'Yellow' }
    d.pythonExceptions = { link = 'Purple' }
    d.pythonDecoratorName = { link = 'Blue' }
    -- python-syntax: https://github.com/vim-python/python-syntax
    d.pythonExClass = { link = 'Purple' }
    d.pythonBuiltinType = { link = 'Yellow' }
    d.pythonBuiltinObj = { link = 'Blue' }
    d.pythonDottedName = { link = 'PurpleItalic' }
    d.pythonBuiltinFunc = { link = 'GreenBold' }
    d.pythonFunction = { link = 'AquaBold' }
    d.pythonDecorator = { link = 'Orange' }
    d.pythonInclude = { link = 'Include' }
    d.pythonImport = { link = 'PreProc' }
    d.pythonRun = { link = 'Blue' }
    d.pythonCoding = { link = 'Grey' }
    d.pythonOperator = { link = 'Orange' }
    d.pythonConditional = { link = 'RedItalic' }
    d.pythonRepeat = { link = 'RedItalic' }
    d.pythonException = { link = 'RedItalic' }
    d.pythonNone = { link = 'Aqua' }
    d.pythonDot = { link = 'Grey' }
    -- semshi: https://github.com/numirias/semshi
    -- d.semshiUnresolved = {fg = colors.yellow, gui = "undercurl"}
    -- d.semshiImported = {link = "Purple"}
    -- d.semshiParameter = {link = "Blue"}
    -- d.semshiParameterUnused = {link = "Grey"}
    -- d.semshiSelf = {link = "PurpleItalic"}
    -- d.semshiGlobal = {link = "Yellow"}
    -- d.semshiBuiltin = {link = "Yellow"}
    -- d.semshiAttribute = {link = "Aqua"}
    -- d.semshiLocal = {link = "Red"}
    -- d.semshiFree = {link = "Red"}
    -- d.semshiSelected = {link = "CurrentWord"}
    -- d.semshiErrorSign = {link = "RedSign"}
    -- d.semshiErrorChar = {link = "RedSign"}
    -- lua
    d.luaFunc = { link = 'Green' }
    d.luaFunction = { link = 'Aqua' }
    d.luaTable = { link = 'Fg' }
    d.luaIn = { link = 'RedItalic' }
    -- " vim-lua: https://github.com/tbastos/vim-lua {{{
    d.luaFuncCall = { link = 'Green' }
    d.luaLocal = { link = 'Orange' }
    d.luaSpecialValue = { link = 'Green' }
    d.luaBraces = { link = 'Fg' }
    d.luaBuiltIn = { link = 'Purple' }
    d.luaNoise = { link = 'Grey' }
    d.luaLabel = { link = 'Purple' }
    d.luaFuncTable = { link = 'Yellow' }
    d.luaFuncArgName = { link = 'Blue' }
    d.luaEllipsis = { link = 'Orange' }
    d.luaDocTag = { link = 'Green' }
    -- moon
    -- moonscript-vim: https://github.com/leafo/moonscript-vim
    d.moonInterpDelim = { link = 'Yellow' }
    d.moonInterp = { link = 'Blue' }
    d.moonFunction = { link = 'Green' }
    d.moonLuaFunc = { link = 'AquaBold' }
    d.moonSpecialVar = { link = 'Purple' }
    d.moonObject = { link = 'Yellow' }
    d.moonDotAccess = { link = 'Grey' }
    -- java
    d.javaClassDecl = { link = 'RedItalic' }
    d.javaMethodDecl = { link = 'RedItalic' }
    d.javaVarArg = { link = 'Green' }
    d.javaAnnotation = { link = 'Blue' }
    d.javaUserLabel = { link = 'Purple' }
    d.javaTypedef = { link = 'Aqua' }
    d.javaParen = { link = 'Fg' }
    d.javaParen1 = { link = 'Fg' }
    d.javaParen2 = { link = 'Fg' }
    d.javaParen3 = { link = 'Fg' }
    d.javaParen4 = { link = 'Fg' }
    d.javaParen5 = { link = 'Fg' }
    -- kotlin
    -- kotlin-vim: https://github.com/udalov/kotlin-vim
    d.ktSimpleInterpolation = { link = 'Yellow' }
    d.ktComplexInterpolation = { link = 'Yellow' }
    d.ktComplexInterpolationBrace = { link = 'Yellow' }
    d.ktStructure = { link = 'RedItalic' }
    d.ktKeyword = { link = 'Aqua' }
    -- scala
    d.scalaNameDefinition = { link = 'Aqua' }
    d.scalaInterpolationBoundary = { link = 'Yellow' }
    d.scalaInterpolation = { link = 'Blue' }
    d.scalaTypeOperator = { link = 'Orange' }
    d.scalaOperator = { link = 'Orange' }
    d.scalaKeywordModifier = { link = 'Orange' }
    -- go
    d.goDirective = { link = 'PurpleItalic' }
    d.goConstants = { link = 'Aqua' }
    d.goDeclType = { link = 'OrangeItalic' }
    d.goPackage = { link = 'PurpleItalic' }
    d.goImport = { link = 'PurpleItalic' }
    d.goVarArgs = { link = 'Blue' }
    d.goBuiltins = { link = 'GreenBold' }
    d.goPredefinedIdentifiers = { link = 'Aqua' }
    d.goVar = { link = 'Orange' }
    -- rust
    d.rustStructure = { link = 'Orange' }
    d.rustIdentifier = { link = 'Purple' }
    d.rustModPath = { link = 'Orange' }
    d.rustModPathSep = { link = 'Grey' }
    d.rustSelf = { link = 'Blue' }
    d.rustSuper = { link = 'Blue' }
    d.rustDeriveTrait = { link = 'PurpleItalic' }
    d.rustEnumVariant = { link = 'Purple' }
    d.rustMacroVariable = { link = 'Blue' }
    d.rustAssert = { link = 'Aqua' }
    d.rustPanic = { link = 'Aqua' }
    d.rustPubScopeCrate = { link = 'PurpleItalic' }
    -- swift
    -- swift.vim: https://github.com/keith/swift.vim
    d.swiftInterpolatedWrapper = { link = 'Yellow' }
    d.swiftInterpolatedString = { link = 'Blue' }
    d.swiftProperty = { link = 'Aqua' }
    d.swiftTypeDeclaration = { link = 'Orange' }
    d.swiftClosureArgument = { link = 'Purple' }
    -- php
    d.phpVarSelector = { link = 'Blue' }
    d.phpDefine = { link = 'OrangeItalic' }
    d.phpStructure = { link = 'RedItalic' }
    d.phpSpecialFunction = { link = 'GreenBold' }
    d.phpInterpSimpleCurly = { link = 'Yellow' }
    d.phpComparison = { link = 'Orange' }
    d.phpMethodsVar = { link = 'Aqua' }
    d.phpMemberSelector = { link = 'Green' }
    d.phpParent = { link = 'Fg' }
    -- php.vim: https://github.com/StanAngeloff/php.vim
    d.phpNowDoc = { link = 'Green' }
    d.phpFunction = { link = 'GreenBold' }
    d.phpMethod = { link = 'GreenBold' }
    d.phpClass = { link = 'Orange' }
    d.phpSuperglobals = { link = 'Purple' }
    -- ruby
    d.rubyKeywordAsMethod = { link = 'GreenBold' }
    d.rubyInterpolation = { link = 'Yellow' }
    d.rubyInterpolationDelimiter = { link = 'Yellow' }
    d.rubyStringDelimiter = { link = 'Green' }
    d.rubyBlockParameterList = { link = 'Blue' }
    d.rubyDefine = { link = 'RedItalic' }
    d.rubyModuleName = { link = 'Purple' }
    d.rubyAccess = { link = 'Orange' }
    d.rubyAttribute = { link = 'Yellow' }
    d.rubyMacro = { link = 'RedItalic' }
    -- haskell
    -- haskell-vim: https://github.com/neovimhaskell/haskell-vim
    d.haskellBrackets = { link = 'Blue' }
    d.haskellIdentifier = { link = 'Yellow' }
    d.haskellAssocType = { link = 'Aqua' }
    d.haskellQuotedType = { link = 'Aqua' }
    d.haskellType = { link = 'Aqua' }
    d.haskellDeclKeyword = { link = 'RedItalic' }
    d.haskellWhere = { link = 'RedItalic' }
    d.haskellDeriving = { link = 'PurpleItalic' }
    d.haskellForeignKeywords = { link = 'PurpleItalic' }
    -- perl
    d.perlStatementPackage = { link = 'PurpleItalic' }
    d.perlStatementInclude = { link = 'PurpleItalic' }
    d.perlStatementStorage = { link = 'Orange' }
    d.perlStatementList = { link = 'Orange' }
    d.perlMatchStartEnd = { link = 'Orange' }
    d.perlVarSimpleMemberName = { link = 'Aqua' }
    d.perlVarSimpleMember = { link = 'Fg' }
    d.perlMethod = { link = 'GreenBold' }
    d.podVerbatimLine = { link = 'Green' }
    d.podCmdText = { link = 'Yellow' }
    -- ocaml
    d.ocamlArrow = { link = 'Orange' }
    d.ocamlEqual = { link = 'Orange' }
    d.ocamlOperator = { link = 'Orange' }
    d.ocamlKeyChar = { link = 'Orange' }
    d.ocamlModPath = { link = 'Green' }
    d.ocamlFullMod = { link = 'Green' }
    d.ocamlModule = { link = 'Purple' }
    d.ocamlConstructor = { link = 'Aqua' }
    d.ocamlFuncWith = { link = 'Yellow' }
    d.ocamlWith = { link = 'Yellow' }
    d.ocamlModParam = { link = 'Fg' }
    d.ocamlModParam1 = { link = 'Fg' }
    d.ocamlAnyVar = { link = 'Blue' }
    d.ocamlPpxEncl = { link = 'Orange' }
    d.ocamlPpxIdentifier = { link = 'Blue' }
    d.ocamlSigEncl = { link = 'Orange' }
    d.ocamlStructEncl = { link = 'Aqua' }
    -- erlang
    d.erlangAtom = { link = 'Aqua' }
    d.erlangLocalFuncRef = { link = 'GreenBold' }
    d.erlangLocalFuncCall = { link = 'GreenBold' }
    d.erlangGlobalFuncRef = { link = 'GreenBold' }
    d.erlangGlobalFuncCall = { link = 'GreenBold' }
    d.erlangAttribute = { link = 'PurpleItalic' }
    d.erlangPipe = { link = 'Orange' }
    -- elixir
    -- vim-elixir: https://github.com/elixir-editors/vim-elixir
    d.elixirStringDelimiter = { link = 'Green' }
    d.elixirKeyword = { link = 'Orange' }
    d.elixirInterpolation = { link = 'Yellow' }
    d.elixirInterpolationDelimiter = { link = 'Yellow' }
    d.elixirSelf = { link = 'Purple' }
    d.elixirPseudoVariable = { link = 'Purple' }
    d.elixirModuleDefine = { link = 'PurpleItalic' }
    d.elixirBlockDefinition = { link = 'RedItalic' }
    d.elixirDefine = { link = 'RedItalic' }
    d.elixirPrivateDefine = { link = 'RedItalic' }
    d.elixirGuard = { link = 'RedItalic' }
    d.elixirPrivateGuard = { link = 'RedItalic' }
    d.elixirProtocolDefine = { link = 'RedItalic' }
    d.elixirImplDefine = { link = 'RedItalic' }
    d.elixirRecordDefine = { link = 'RedItalic' }
    d.elixirPrivateRecordDefine = { link = 'RedItalic' }
    d.elixirMacroDefine = { link = 'RedItalic' }
    d.elixirPrivateMacroDefine = { link = 'RedItalic' }
    d.elixirDelegateDefine = { link = 'RedItalic' }
    d.elixirOverridableDefine = { link = 'RedItalic' }
    d.elixirExceptionDefine = { link = 'RedItalic' }
    d.elixirCallbackDefine = { link = 'RedItalic' }
    d.elixirStructDefine = { link = 'RedItalic' }
    d.elixirExUnitMacro = { link = 'RedItalic' }
    -- lisp
    d.lispAtomMark = { link = 'Green' }
    d.lispKey = { link = 'Aqua' }
    d.lispFunc = { link = 'OrangeItalic' }
    -- closure
    d.clojureMacro = { link = 'PurpleItalic' }
    d.clojureFunc = { link = 'AquaBold' }
    d.clojureConstant = { link = 'Yellow' }
    d.clojureSpecial = { link = 'RedItalic' }
    d.clojureDefine = { link = 'RedItalic' }
    d.clojureKeyword = { link = 'Orange' }
    d.clojureVariable = { link = 'Blue' }
    d.clojureMeta = { link = 'Yellow' }
    d.clojureDeref = { link = 'Yellow' }
    -- matlab
    d.matlabSemicolon = { link = 'Fg' }
    d.matlabFunction = { link = 'RedItalic' }
    d.matlabImplicit = { link = 'GreenBold' }
    d.matlabDelimiter = { link = 'Fg' }
    d.matlabOperator = { link = 'GreenBold' }
    d.matlabArithmeticOperator = { link = 'Orange' }
    d.matlabRelationalOperator = { link = 'Orange' }
    d.matlabLogicalOperator = { link = 'Orange' }
    -- sh/zsh
    d.shRange = { link = 'Fg' }
    d.shTestOpr = { link = 'Orange' }
    d.shOption = { link = 'Aqua' }
    d.bashStatement = { link = 'Orange' }
    d.shOperator = { link = 'Orange' }
    d.shQuote = { link = 'Green' }
    d.shSet = { link = 'Orange' }
    d.shSetList = { link = 'Blue' }
    d.shSnglCase = { link = 'Orange' }
    d.shVariable = { link = 'Blue' }
    d.shVarAssign = { link = 'Orange' }
    d.shCmdSubRegion = { link = 'Green' }
    d.shCommandSub = { link = 'Orange' }
    d.shFunctionOne = { link = 'GreenBold' }
    d.shFunctionKey = { link = 'RedItalic' }
    d.zshOptStart = { link = 'PurpleItalic' }
    d.zshOption = { link = 'Blue' }
    d.zshSubst = { link = 'Yellow' }
    d.zshFunction = { link = 'GreenBold' }
    d.zshDeref = { link = 'Blue' }
    d.zshTypes = { link = 'Orange' }
    d.zshVariableDef = { link = 'Blue' }
    -- fish
    d.fishStatement = { link = 'Orange' }
    d.fishLabel = { link = 'RedItalic' }
    d.fishCommandSub = { link = 'Yellow' }
    -- ps1
    -- d.ps1FunctionInvocation = {link = "AquaBold"}
    -- d.ps1FunctionDeclaration = {link = "AquaBold"}
    -- d.ps1InterpolationDelimiter = {link = "Yellow"}
    -- d.ps1BuiltIn = {link = "Yellow"}
    -- vim
    d.vimCommentTitle = { fg = colors.grey1, gui = 'bold' }
    d.vimLet = { link = 'Orange' }
    d.vimFunction = { link = 'GreenBold' }
    d.vimIsCommand = { link = 'Fg' }
    d.vimUserFunc = { link = 'GreenBold' }
    d.vimFuncName = { link = 'GreenBold' }
    d.vimMap = { link = 'PurpleItalic' }
    d.vimNotation = { link = 'Aqua' }
    d.vimMapLhs = { link = 'Green' }
    d.vimMapRhs = { link = 'Green' }
    d.vimSetEqual = { link = 'Yellow' }
    d.vimSetSep = { link = 'Fg' }
    d.vimOption = { link = 'Aqua' }
    d.vimUserAttrbKey = { link = 'Yellow' }
    d.vimUserAttrb = { link = 'Green' }
    d.vimAutoCmdSfxList = { link = 'Aqua' }
    d.vimSynType = { link = 'Orange' }
    d.vimHiBang = { link = 'Orange' }
    d.vimSet = { link = 'Yellow' }
    d.vimContinue = { link = 'Grey' }
    -- make
    d.makeIdent = { link = 'Aqua' }
    d.makeSpecTarget = { link = 'Yellow' }
    d.makeTarget = { link = 'Blue' }
    d.makeCommands = { link = 'Orange' }
    -- cmake
    -- d.cmakeCommand = {link = "Orange"}
    -- d.cmakeKWconfigure_package_config_file = {link = "Yellow"}
    -- d.cmakeKWwrite_basic_package_version_file = {link = "Yellow"}
    -- d.cmakeKWExternalProject = {link = "Aqua"}
    -- d.cmakeKWadd_compile_definitions = {link = "Aqua"}
    -- d.cmakeKWadd_compile_options = {link = "Aqua"}
    -- d.cmakeKWadd_custom_command = {link = "Aqua"}
    -- d.cmakeKWadd_custom_target = {link = "Aqua"}
    -- d.cmakeKWadd_definitions = {link = "Aqua"}
    -- d.cmakeKWadd_dependencies = {link = "Aqua"}
    -- d.cmakeKWadd_executable = {link = "Aqua"}
    -- d.cmakeKWadd_library = {link = "Aqua"}
    -- d.cmakeKWadd_link_options = {link = "Aqua"}
    -- d.cmakeKWadd_subdirectory = {link = "Aqua"}
    -- d.cmakeKWadd_test = {link = "Aqua"}
    -- d.cmakeKWbuild_command = {link = "Aqua"}
    -- d.cmakeKWcmake_host_system_information = {link = "Aqua"}
    -- d.cmakeKWcmake_minimum_required = {link = "Aqua"}
    -- d.cmakeKWcmake_parse_arguments = {link = "Aqua"}
    -- d.cmakeKWcmake_policy = {link = "Aqua"}
    -- d.cmakeKWconfigure_file = {link = "Aqua"}
    -- d.cmakeKWcreate_test_sourcelist = {link = "Aqua"}
    -- d.cmakeKWctest_build = {link = "Aqua"}
    -- d.cmakeKWctest_configure = {link = "Aqua"}
    -- d.cmakeKWctest_coverage = {link = "Aqua"}
    -- d.cmakeKWctest_memcheck = {link = "Aqua"}
    -- d.cmakeKWctest_run_script = {link = "Aqua"}
    -- d.cmakeKWctest_start = {link = "Aqua"}
    -- d.cmakeKWctest_submit = {link = "Aqua"}
    -- d.cmakeKWctest_test = {link = "Aqua"}
    -- d.cmakeKWctest_update = {link = "Aqua"}
    -- d.cmakeKWctest_upload = {link = "Aqua"}
    -- d.cmakeKWdefine_property = {link = "Aqua"}
    -- d.cmakeKWdoxygen_add_docs = {link = "Aqua"}
    -- d.cmakeKWenable_language = {link = "Aqua"}
    -- d.cmakeKWenable_testing = {link = "Aqua"}
    -- d.cmakeKWexec_program = {link = "Aqua"}
    -- d.cmakeKWexecute_process = {link = "Aqua"}
    -- d.cmakeKWexport = {link = "Aqua"}
    -- d.cmakeKWexport_library_dependencies = {link = "Aqua"}
    -- d.cmakeKWfile = {link = "Aqua"}
    -- d.cmakeKWfind_file = {link = "Aqua"}
    -- d.cmakeKWfind_library = {link = "Aqua"}
    -- d.cmakeKWfind_package = {link = "Aqua"}
    -- d.cmakeKWfind_path = {link = "Aqua"}
    -- d.cmakeKWfind_program = {link = "Aqua"}
    -- d.cmakeKWfltk_wrap_ui = {link = "Aqua"}
    -- d.cmakeKWforeach = {link = "Aqua"}
    -- d.cmakeKWfunction = {link = "Aqua"}
    -- d.cmakeKWget_cmake_property = {link = "Aqua"}
    -- d.cmakeKWget_directory_property = {link = "Aqua"}
    -- d.cmakeKWget_filename_component = {link = "Aqua"}
    -- d.cmakeKWget_property = {link = "Aqua"}
    -- d.cmakeKWget_source_file_property = {link = "Aqua"}
    -- d.cmakeKWget_target_property = {link = "Aqua"}
    -- d.cmakeKWget_test_property = {link = "Aqua"}
    -- d.cmakeKWif = {link = "Aqua"}
    -- d.cmakeKWinclude = {link = "Aqua"}
    -- d.cmakeKWinclude_directories = {link = "Aqua"}
    -- d.cmakeKWinclude_external_msproject = {link = "Aqua"}
    -- d.cmakeKWinclude_guard = {link = "Aqua"}
    -- d.cmakeKWinstall = {link = "Aqua"}
    -- d.cmakeKWinstall_files = {link = "Aqua"}
    -- d.cmakeKWinstall_programs = {link = "Aqua"}
    -- d.cmakeKWinstall_targets = {link = "Aqua"}
    -- d.cmakeKWlink_directories = {link = "Aqua"}
    -- d.cmakeKWlist = {link = "Aqua"}
    -- d.cmakeKWload_cache = {link = "Aqua"}
    -- d.cmakeKWload_command = {link = "Aqua"}
    -- d.cmakeKWmacro = {link = "Aqua"}
    -- d.cmakeKWmark_as_advanced = {link = "Aqua"}
    -- d.cmakeKWmath = {link = "Aqua"}
    -- d.cmakeKWmessage = {link = "Aqua"}
    -- d.cmakeKWoption = {link = "Aqua"}
    -- d.cmakeKWproject = {link = "Aqua"}
    -- d.cmakeKWqt_wrap_cpp = {link = "Aqua"}
    -- d.cmakeKWqt_wrap_ui = {link = "Aqua"}
    -- d.cmakeKWremove = {link = "Aqua"}
    -- d.cmakeKWseparate_arguments = {link = "Aqua"}
    -- d.cmakeKWset = {link = "Aqua"}
    -- d.cmakeKWset_directory_properties = {link = "Aqua"}
    -- d.cmakeKWset_property = {link = "Aqua"}
    -- d.cmakeKWset_source_files_properties = {link = "Aqua"}
    -- d.cmakeKWset_target_properties = {link = "Aqua"}
    -- d.cmakeKWset_tests_properties = {link = "Aqua"}
    -- d.cmakeKWsource_group = {link = "Aqua"}
    -- d.cmakeKWstring = {link = "Aqua"}
    -- d.cmakeKWsubdirs = {link = "Aqua"}
    -- d.cmakeKWtarget_compile_definitions = {link = "Aqua"}
    -- d.cmakeKWtarget_compile_features = {link = "Aqua"}
    -- d.cmakeKWtarget_compile_options = {link = "Aqua"}
    -- d.cmakeKWtarget_include_directories = {link = "Aqua"}
    -- d.cmakeKWtarget_link_directories = {link = "Aqua"}
    -- d.cmakeKWtarget_link_libraries = {link = "Aqua"}
    -- d.cmakeKWtarget_link_options = {link = "Aqua"}
    -- d.cmakeKWtarget_precompile_headers = {link = "Aqua"}
    -- d.cmakeKWtarget_sources = {link = "Aqua"}
    -- d.cmakeKWtry_compile = {link = "Aqua"}
    -- d.cmakeKWtry_run = {link = "Aqua"}
    -- d.cmakeKWunset = {link = "Aqua"}
    -- d.cmakeKWuse_mangled_mesa = {link = "Aqua"}
    -- d.cmakeKWvariable_requires = {link = "Aqua"}
    -- d.cmakeKWvariable_watch = {link = "Aqua"}
    -- d.cmakeKWwrite_file = {link = "Aqua"}
    -- json
    d.jsonKeyword = { link = 'Orange' }
    d.jsonQuote = { link = 'Grey' }
    d.jsonBraces = { link = 'Fg' }
    -- yaml
    d.yamlKey = { link = 'Orange' }
    d.yamlConstant = { link = 'Purple' }
    -- toml
    d.tomlTable = { fg = colors.purple, gui = 'bold' }
    d.tomlKey = { link = 'Orange' }
    d.tomlBoolean = { link = 'Aqua' }
    d.tomlTableArray = { link = 'tomlTable' }
    -- gicommit
    d.gitcommitSummary = { link = 'Red' }
    d.gitcommitUntracked = { link = 'Grey' }
    d.gitcommitDiscarded = { link = 'Grey' }
    d.gitcommitSelected = { link = 'Grey' }
    d.gitcommitUnmerged = { link = 'Grey' }
    d.gitcommitOnBranch = { link = 'Grey' }
    d.gitcommitArrow = { link = 'Grey' }
    d.gitcommitFile = { link = 'Green' }
    -- dosini
    -- d.dosiniHeader = {fg = colors.red, gui = "bold"}
    -- d.dosiniLabel = {link = "Yellow"}
    -- d.dosiniValue = {link = "Green"}
    -- d.dosiniNumber = {link = "Green"}
    -- help
    d.helpNote = { fg = colors.purple, gui = 'bold' }
    d.helpHeadline = { fg = colors.red, gui = 'bold' }
    d.helpHeader = { fg = colors.orange, gui = 'bold' }
    d.helpURL = { fg = colors.green, gui = 'underline' }
    d.helpHyperTextEntry = { fg = colors.yellow, gui = 'bold' }
    d.helpHyperTextJump = { link = 'Yellow' }
    d.helpCommand = { link = 'Aqua' }
    d.helpExample = { link = 'Green' }
    d.helpSpecial = { link = 'Blue' }
    d.helpSectionDelim = { link = 'Grey' }
    -- ####### Extended: End

    return d
end

function definitions.terminal(colors)
    local dark = is_dark and colors.bg5[1] or colors.fg0[1]
    local light = is_dark and colors.fg0[1] or colors.bg5[1]

    vim.g.terminal_color_0 = dark
    vim.g.terminal_color_1 = colors.red[1]
    vim.g.terminal_color_2 = colors.green[1]
    vim.g.terminal_color_3 = colors.yellow[1]
    vim.g.terminal_color_4 = colors.blue[1]
    vim.g.terminal_color_5 = colors.purple[1]
    vim.g.terminal_color_6 = colors.aqua[1]
    vim.g.terminal_color_7 = light

    vim.g.terminal_color_8 = dark
    vim.g.terminal_color_9 = colors.red[1]
    vim.g.terminal_color_10 = colors.green[1]
    vim.g.terminal_color_11 = colors.yellow[1]
    vim.g.terminal_color_12 = colors.blue[1]
    vim.g.terminal_color_13 = colors.purple[1]
    vim.g.terminal_color_14 = colors.aqua[1]
    vim.g.terminal_color_15 = light

    vim.g.terminal_color_background = dark
    vim.g.terminal_color_foreground = light
end

return definitions
