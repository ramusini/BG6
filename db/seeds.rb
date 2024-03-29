# frozen_string_literal: true

Admin.create!(email: "admin@admin.com",
              password: "123456",
             )

Tag.create([
            { name: "タイルプレイスメント" },
            { name: "ワーカプレイスメント" },
            { name: "陣取り" },
            { name: "拡大再生産" },
            { name: "競り" },
            { name: "正体隠匿" },
            { name: "デッキビルド" },
            { name: "エンジンビルド" },
            { name: "協力" },
            { name: "カード" },
            { name: "アクション" },
            { name: "特殊" }
])
