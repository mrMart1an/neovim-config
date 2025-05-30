-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require('lazy').setup({
    require 'plugins.editor',
    require 'plugins.bufferline',
    require 'plugins.toggleterm',
    require 'plugins.theme',
    require 'plugins.telescope',
    require 'plugins.nvimtree',
    require 'plugins.gitsigns',
    require 'plugins.dropbar',

    require 'plugins.treesitter',

    require 'plugins.lsp',
    require 'plugins.blink',

    require 'plugins.debug',

    require 'plugins.alpha'
})

