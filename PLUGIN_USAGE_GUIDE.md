# Plugin Usage Guide - Harpoon & Undotree

## 🎯 Harpoon Plugin

Harpoon adalah plugin untuk bookmark file-file penting yang sering Anda akses, memungkinkan navigasi cepat antar file.

### Key Bindings Harpoon:

| Key Combination | Function | Description |
|----------------|----------|-------------|
| `<leader>a` | Add File | Menambahkan file saat ini ke harpoon |
| `<leader>ma` | Toggle Menu | Membuka/menutup menu harpoon |
| `<leader>ha` | Add File (Alt) | Alternatif untuk menambah file |
| `<leader>hm` | Toggle Menu (Alt) | Alternatif untuk toggle menu |
| `<leader>1` | Go to Mark 1 | Langsung ke file bookmark 1 |
| `<leader>2` | Go to Mark 2 | Langsung ke file bookmark 2 |
| `<leader>3` | Go to Mark 3 | Langsung ke file bookmark 3 |
| `<leader>4` | Go to Mark 4 | Langsung ke file bookmark 4 |
| `<C-S-P>` | Previous | Navigasi ke bookmark sebelumnya |
| `<C-S-N>` | Next | Navigasi ke bookmark berikutnya |
| `<leader>hr` | Clear All | Menghapus semua bookmark |
| `<leader>hs` | Remove Current | Menghapus file saat ini dari bookmark |

### Cara Menggunakan Harpoon:

1. **Menambah File ke Bookmark:**
   ```
   Tekan <leader>a (Space + a) saat berada di file yang ingin di-bookmark
   ```

2. **Melihat Menu Harpoon:**
   ```
   Tekan <leader>ma (Space + m + a) untuk membuka menu harpoon
   ```

3. **Navigasi Cepat:**
   ```
   Tekan <leader>1, <leader>2, <leader>3, atau <leader>4 untuk langsung ke file bookmark
   ```

4. **Navigasi Sequential:**
   ```
   Tekan <C-S-P> untuk ke bookmark sebelumnya
   Tekan <C-S-N> untuk ke bookmark berikutnya
   ```

### Konfigurasi Harpoon:

Harpoon dikonfigurasi dengan pengaturan berikut:
- `save_on_toggle = false` - Tidak menyimpan saat toggle
- `save_on_change = true` - Menyimpan saat ada perubahan
- `enter_on_sendcmd = false` - Tidak masuk terminal otomatis
- `tmux_autoclose_windows = false` - Tidak menutup tmux windows
- `excluded_filetypes = { "harpoon" }` - Exclude filetype harpoon
- `mark_branch = false` - Tidak mark per git branch
- `tabline = false` - Tidak menampilkan di tabline

---

## 🌳 Undotree Plugin (jiaoshijie/undotree)

Undotree adalah plugin modern untuk melihat dan mengelola history perubahan file secara visual, ditulis dalam Lua untuk performa yang lebih baik.

### Key Bindings Undotree:

| Key Combination | Function | Description |
|----------------|----------|-------------|
| `<leader>u` | Toggle Undotree | Membuka/menutup undotree |
| `<leader>uo` | Open Undotree | Membuka undotree |
| `<leader>uc` | Close Undotree | Menutup undotree |

### Navigation dalam Undotree:

| Key | Action | Description |
|-----|--------|-------------|
| `j` | move_next | Jump ke undo node berikutnya |
| `k` | move_prev | Jump ke undo node sebelumnya |
| `gj` | move2parent | Jump ke parent node |
| `J` | move_change_next | Jump ke next node dan undo ke state ini |
| `K` | move_change_prev | Jump ke prev node dan undo ke state ini |
| `q` | quit | Keluar dari undotree |
| `p` | enter_diffbuf | Masuk ke diff window |
| `Enter` | action_enter | Undo ke state yang dipilih |

### Cara Menggunakan Undotree:

1. **Membuka Undotree:**
   ```
   Tekan <leader>u (Space + u) untuk toggle undotree
   Tekan <leader>uo (Space + u + o) untuk membuka undotree
   ```

2. **Menutup Undotree:**
   ```
   Tekan <leader>uc (Space + u + c) untuk menutup undotree
   Atau tekan q saat berada di dalam undotree
   ```

3. **Navigasi di Undotree:**
   ```
   Gunakan j/k untuk navigasi antar node
   Gunakan J/K untuk undo ke state tertentu
   Tekan Enter untuk memilih state
   Tekan p untuk melihat diff
   ```

4. **User Command:**
   ```
   :Undotree toggle  - Toggle undotree
   :Undotree open    - Buka undotree
   :Undotree close   - Tutup undotree
   ```

### Konfigurasi Undotree:

Undotree dikonfigurasi dengan pengaturan berikut:
- `float_diff = true` - Menggunakan float window untuk preview diff
- `layout = "left_bottom"` - Layout window (left_bottom, left_left_bottom)
- `position = "left"` - Posisi window (left, right, bottom)
- `ignore_filetype = {'undotree', 'undotreeDiff', 'qf'}` - Filetype yang diabaikan
- `window.winblend = 30` - Transparansi window
- `window.border = "rounded"` - Style border
- Custom keymaps untuk navigasi yang optimal

---

## 🔧 Plugin Management

### Mengaktifkan/Menonaktifkan Plugin:

1. **Plugin Manager:**
   ```
   Tekan <leader>pm (Space + p + m) untuk membuka plugin manager
   ```

2. **Plugin Status:**
   ```
   Tekan <leader>ps (Space + p + s) untuk melihat status semua plugin
   ```

3. **Health Check:**
   ```
   Tekan <leader>hc (Space + h + c) untuk pengecekan kesehatan konfigurasi
   ```

### Troubleshooting:

#### Harpoon tidak berfungsi:
1. Pastikan plugin harpoon aktif: `<leader>ps`
2. Jika tidak aktif, aktifkan via: `<leader>pm`
3. Restart Neovim jika diperlukan

#### Undotree tidak muncul:
1. Pastikan plugin undotree aktif: `<leader>ps`
2. Cek apakah ada file yang memiliki history undo
3. Pastikan tidak ada konflik keymap

#### Plugin tidak dimuat:
1. Jalankan health check: `<leader>hc`
2. Sync plugin: `:Lazy sync`
3. Restart Neovim

---

## 📝 Tips Penggunaan:

### Harpoon:
- Gunakan untuk file-file yang sering diakses (main files, config files, dll)
- Maksimal 4 bookmark untuk navigasi cepat dengan number keys
- Gunakan menu harpoon untuk melihat semua bookmark

### Undotree:
- Sangat berguna untuk melihat perubahan yang kompleks
- Gunakan untuk recovery dari perubahan yang tidak diinginkan
- Diff panel membantu melihat perubahan secara detail

### Plugin Management:
- Gunakan plugin manager untuk mengaktifkan/menonaktifkan plugin sesuai kebutuhan
- Health check membantu mendeteksi masalah konfigurasi
- Plugin status membantu melihat plugin mana yang aktif

---

**Happy coding! 🚀**
