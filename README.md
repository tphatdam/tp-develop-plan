# TP Develop Plan

`tp-develop-plan` là một skill workflow phát triển phần mềm dùng được cho nhiều coding agent và AI IDE. Skill này biến một yêu cầu code còn mơ hồ thành PRD rõ ràng, danh sách issue triển khai, vòng TDD, và bước refactor cuối để code dễ đọc hơn.

Skill được viết bằng Markdown thuần, nên có thể dùng trong các môi trường hiểu hướng dẫn kiểu `SKILL.md`, bao gồm Codex, Cursor, Claude Code, Antigravity, Kiro CLI, GitHub Copilot, Windsurf, Gemini, Cline, AMP, OpenCode, Roo, Trae, VS Code, Zed, và các tool tương tự.

## Giới Thiệu

Workflow chính có 5 stage bắt buộc:

1. `grill-me`: hỏi rõ mục tiêu, phạm vi, ràng buộc và tiêu chí thành công.
2. `prd`: viết PRD ngắn gọn trước khi triển khai.
3. `issues`: chia PRD thành các task/issue dạng Markdown.
4. `tdd`: viết hoặc cập nhật test trước khi sửa production code khi có thể.
5. `refactor code`: cải thiện khả năng đọc code sau khi hành vi đã được verify.

Skill cũng có các sub-mode tham khảo lấy cảm hứng từ workflow phổ biến trên `skills.sh`, như `grill-with-docs`, `triage`, `prototype`, `codebase-design`, `improve-codebase-architecture`, `tdd`, và `handoff`.

## Cài Đặt Nhanh

Chạy lệnh này từ project root:

```bash
npx skills add tphatdam/tp-develop-plan
```

Sau đó mở session mới trong coding agent hoặc AI IDE để tool nhận skill vừa cài.

## Cài Đặt Thủ Công

Clone repository và copy skill vào thư mục skills local:

```bash
git clone https://github.com/tphatdam/tp-develop-plan.git
mkdir -p ~/.codex/skills
cp -R tp-develop-plan ~/.codex/skills/tp-develop-plan
```

Với các agent dùng skill theo từng repository, hãy copy `SKILL.md` vào đúng vị trí mà tool đó yêu cầu cho project skills.

## Cách Dùng

Gọi skill trực tiếp bằng tên:

```text
Use $tp-develop-plan to plan and implement this feature with grill-me, PRD, issues, TDD, and refactor stages.
```

Hoặc mô tả tự nhiên:

```text
Use tp-develop-plan for this bugfix. Grill me first, then write the PRD, split issues, implement with TDD, and refactor for readability.
```

## Phù Hợp Cho

- Feature mới cần làm rõ yêu cầu trước khi code.
- Bugfix cần test để verify hành vi.
- Refactor cần giữ nguyên behavior nhưng làm code dễ đọc hơn.
- Handoff giữa nhiều agent hoặc nhiều session.
- Workflow dùng chung giữa Codex, Cursor, Claude Code, Antigravity, Kiro CLI và các IDE/agent khác.

## Nguyên Tắc Sử Dụng

- Không nhảy thẳng vào code khi yêu cầu còn mơ hồ.
- Luôn biến acceptance criteria thành cách verify cụ thể.
- Ưu tiên test trước khi sửa code nếu repo có test setup khả dụng.
- Chỉ tạo GitHub Issues, PR hoặc artifact bên ngoài khi người dùng yêu cầu rõ.
- Sau khi refactor, chạy lại cùng verification đã dùng ở stage TDD.

## Repository

GitHub: https://github.com/tphatdam/tp-develop-plan
