$ErrorActionPreference = 'Stop'

$skillPath = Join-Path $PSScriptRoot '..\SKILL.md'
$readmePath = Join-Path $PSScriptRoot '..\README.md'
$manifestPath = Join-Path $PSScriptRoot '..\agents\openai.yaml'
$content = Get-Content -Raw $skillPath
$readme = Get-Content -Raw $readmePath
$manifest = Get-Content -Raw $manifestPath

$scenarios = @(
    @{ Name = 'Classifies work before planning'; Required = @('## Request Routing', 'Classify the request before planning or coding') },
    @{ Name = 'Discovers context before clarification'; Required = @('Discovery Gate', 'grill-with-docs') },
    @{ Name = 'Routes feature and UI design work'; Required = @('Feature and UI Gate', 'brainstorming', 'explicit user approval') },
    @{ Name = 'Routes bugs through evidence-first debugging'; Required = @('Bug and Unexpected Behavior Gate', 'superpowers:systematic-debugging') },
    @{ Name = 'Labels uncertain work as a throwaway spike'; Required = @('Uncertainty and Prototype Gate', 'throwaway', 'prototype') },
    @{ Name = 'Routes architectural work deliberately'; Required = @('Architecture and Refactor Gate', 'codebase-design', 'improve-codebase-architecture') },
    @{ Name = 'Discovers missing capabilities safely'; Required = @('Capability Discovery Gate', 'find-skills') },
    @{ Name = 'Builds dependency-aware task graphs'; Required = @('dependency-aware task graph', 'frontier') },
    @{ Name = 'Routes multi-step delivery to available execution workflows'; Required = @('superpowers:writing-plans', 'superpowers:using-git-worktrees', 'superpowers:executing-plans', 'superpowers:subagent-driven-development') },
    @{ Name = 'Uses risk-based review with delivery evidence'; Required = @('Risk-Based Review and Verification', '**Before:**', '**After:**', 'Blast radius') },
    @{ Name = 'Preserves behavior during refactors'; Required = @('behavior-preservation boundary', 'Keep feature changes outside the refactor') },
    @{ Name = 'Provides portable fallbacks'; Required = @('Fallback Behavior', 'companion skill is unavailable') }
)

foreach ($scenario in $scenarios) {
    foreach ($required in $scenario.Required) {
        if ($content -notmatch [regex]::Escape($required)) {
            throw "Scenario failed: $($scenario.Name). Missing: $required"
        }
    }
    Write-Output "PASS: $($scenario.Name)"
}

$stages = @('### Stage 1: grill-me', '### Stage 2: prd', '### Stage 3: issues', '### Stage 4: tdd', '### Stage 5: refactor code')
$previousIndex = -1
foreach ($stage in $stages) {
    $stageIndex = $content.IndexOf($stage, [System.StringComparison]::Ordinal)
    if ($stageIndex -le $previousIndex) {
        throw "Core stages are missing or out of order: $stage"
    }
    $previousIndex = $stageIndex
}
Write-Output 'PASS: Retains all five core stages in order'

if ($readme -notmatch [regex]::Escape('dependency-aware task graph')) {
    throw 'README does not describe the task-graph workflow'
}
if ($manifest -notmatch [regex]::Escape('obtain design approval when needed, then produce a PRD and dependency-aware task graph')) {
    throw 'OpenAI manifest does not align with the required design-to-PRD workflow'
}
Write-Output 'PASS: README and OpenAI manifest align with the skill workflow'
