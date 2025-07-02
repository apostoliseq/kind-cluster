folder('helm-charts') {
    displayName('Helm Charts')
    description('All Helm chart related CI/CD jobs')
}

folder('helm-charts/applications') {
    displayName('Applications')
    description('Application deployment pipelines')
}

folder('helm-charts/infrastructure') {
    displayName('Infrastructure')
    description('Infrastructure as Code pipelines')
}