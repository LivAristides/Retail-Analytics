# Documento de Visão do Projeto

> **Projeto:** Retail Analytics - Plataforma de Business Intelligence para uma Rede Nacional de Varejo  
> **Versão:** 1.0  
> **Autor:** Lívia  
> **Data:** Julho de 2026

---

# Histórico de Revisões

| Versão | Data | Autor | Descrição |
|---------|------|--------|-----------|
| 1.0 | Julho/2026 | Lívia | Criação do documento de visão do projeto |

---

# Sumário

1. Introdução
2. Sobre a Empresa
3. Contexto do Negócio
4. Problema de Negócio
5. Justificativa
6. Objetivos
7. Escopo
8. Fora do Escopo
9. Stakeholders
10. Premissas
11. Restrições
12. Arquitetura Geral da Solução
13. Tecnologias Utilizadas
14. Benefícios Esperados
15. Cronograma Macro
16. Critérios de Sucesso
17. Conclusão

---

# 1. Introdução

Este documento apresenta a visão geral do projeto **Retail Analytics**, uma solução completa de Business Intelligence desenvolvida para a empresa fictícia **SmartRetail**.

O projeto tem como objetivo simular um cenário real de mercado, contemplando todas as etapas do ciclo de desenvolvimento de uma solução analítica, desde o levantamento de requisitos até a criação de dashboards executivos no Power BI.

Durante o desenvolvimento serão aplicados conceitos de modelagem de banco de dados, SQL Server, ETL, Data Warehouse, Data Marts e Business Intelligence, seguindo boas práticas utilizadas em projetos corporativos.

Este projeto também tem como finalidade servir como portfólio técnico, demonstrando competências em engenharia e análise de dados.

---

# 2. Sobre a Empresa

A **SmartRetail** é uma empresa fictícia do segmento de varejo nacional especializada na comercialização de produtos eletrônicos, informática, telefonia móvel, eletrodomésticos e acessórios.

A empresa atua por meio de lojas físicas distribuídas em diferentes estados brasileiros e também através de uma plataforma de comércio eletrônico.

## Principais características

- 15 lojas físicas
- Plataforma própria de e-commerce
- Aproximadamente 120 vendedores
- Mais de 1.000 clientes ativos
- Cerca de 250 produtos cadastrados
- Centro de distribuição responsável pela logística das entregas

A SmartRetail realiza centenas de vendas diariamente, gerando um grande volume de dados operacionais.

Embora possua um sistema para registrar suas operações, a empresa ainda não dispõe de uma plataforma analítica capaz de transformar esses dados em informações estratégicas para apoio à tomada de decisão.

---

# 3. Contexto do Negócio

Nos últimos anos, a SmartRetail apresentou crescimento constante em seu volume de vendas, ampliando sua atuação em diferentes regiões do país.

Com esse crescimento, aumentou também a quantidade de informações produzidas diariamente pelos sistemas operacionais.

Os dados encontram-se distribuídos em diferentes tabelas do banco de dados transacional, dificultando análises consolidadas e históricas.

Além disso, diferentes departamentos produzem relatórios próprios utilizando planilhas eletrônicas, ocasionando divergências entre indicadores e aumentando o tempo necessário para geração das informações gerenciais.

A diretoria identificou a necessidade de implantar uma solução de Business Intelligence capaz de centralizar os dados corporativos e fornecer informações confiáveis para todos os níveis da organização.

---

# 4. Problema de Negócio

Durante entrevistas realizadas com gestores das áreas Comercial, Financeira e Marketing foram identificados os seguintes problemas:

- ausência de indicadores consolidados;
- dependência excessiva de planilhas Excel;
- relatórios produzidos manualmente;
- divergência entre informações apresentadas pelos departamentos;
- dificuldade para acompanhar metas comerciais;
- inexistência de histórico consolidado de vendas;
- demora na geração de relatórios executivos;
- dificuldade para identificar tendências de mercado;
- ausência de dashboards interativos para acompanhamento dos resultados.

Esses fatores reduzem a capacidade analítica da empresa e dificultam decisões estratégicas baseadas em dados.

---

# 5. Justificativa

A implantação de uma plataforma de Business Intelligence permitirá transformar dados operacionais em informações estratégicas para toda a organização.

A utilização de um Data Warehouse proporcionará uma base histórica única, padronizada e preparada para análises de desempenho.

Com isso, será possível:

- reduzir o tempo de elaboração de relatórios;
- aumentar a confiabilidade dos dados;
- eliminar retrabalho;
- melhorar o acompanhamento dos indicadores estratégicos;
- apoiar decisões baseadas em dados;
- facilitar análises históricas e comparativas.

---

# 6. Objetivos

## Objetivo Geral

Desenvolver uma plataforma completa de Business Intelligence capaz de integrar dados operacionais, organizar informações analíticas e disponibilizar dashboards interativos para apoio à tomada de decisão.

## Objetivos Específicos

- desenvolver um banco de dados relacional utilizando SQL Server;
- aplicar técnicas de normalização;
- implementar consultas SQL básicas e avançadas;
- desenvolver Views, Stored Procedures, Functions e Triggers;
- construir processos de ETL;
- desenvolver um Data Warehouse utilizando modelo dimensional;
- criar Data Marts especializados;
- desenvolver dashboards executivos utilizando Power BI;
- documentar todas as etapas do projeto.

---

# 7. Escopo

O projeto contempla:

- levantamento de requisitos;
- documentação técnica;
- modelagem conceitual;
- modelagem lógica;
- modelagem física;
- implementação do banco OLTP;
- geração de dados para testes;
- consultas SQL;
- otimização de desempenho;
- desenvolvimento do ETL;
- criação do Data Warehouse;
- construção dos Data Marts;
- desenvolvimento dos dashboards;
- publicação do projeto no GitHub.

---

# 8. Fora do Escopo

Não fazem parte deste projeto:

- desenvolvimento de aplicações web;
- desenvolvimento mobile;
- integração com APIs externas;
- autenticação de usuários;
- infraestrutura em nuvem;
- implantação em ambiente produtivo;
- integrações em tempo real;
- segurança avançada da informação.

---

# 9. Stakeholders

| Stakeholder | Responsabilidade |
|--------------|-----------------|
| Diretoria | Acompanhar indicadores estratégicos |
| Gerência Comercial | Monitorar vendas e desempenho dos vendedores |
| Gerência Financeira | Avaliar faturamento, lucro e margem |
| Marketing | Analisar comportamento dos clientes |
| Equipe de TI | Administrar banco de dados e infraestrutura |
| Analista de Dados | Desenvolver toda a solução analítica |

---

# 10. Premissas

Para o desenvolvimento do projeto considera-se que:

- os dados utilizados serão fictícios;
- todo o desenvolvimento ocorrerá em ambiente local;
- será utilizado SQL Server;
- o Power BI será utilizado para construção dos dashboards;
- o GitHub será utilizado para versionamento do projeto;
- todas as consultas SQL serão documentadas.

---

# 11. Restrições

O projeto possui as seguintes restrições:

- utilização apenas de ferramentas gratuitas ou disponíveis em ambiente acadêmico;
- inexistência de integração com sistemas reais;
- utilização de dados simulados;
- desenvolvimento realizado por uma única pessoa.

---

# 12. Arquitetura Geral da Solução

A arquitetura será composta pelas seguintes camadas:

```text
Sistema Operacional (OLTP)
            │
            ▼
Processo ETL
            │
            ▼
Data Warehouse
            │
            ▼
Data Marts
            │
            ▼
Power BI
            │
            ▼
Dashboards Executivos
```

Essa arquitetura separa o ambiente operacional do ambiente analítico, garantindo melhor desempenho, organização e escalabilidade.

---

# 13. Tecnologias Utilizadas

| Tecnologia | Finalidade |
|------------|------------|
| SQL Server | Banco de dados relacional |
| SQL Server Management Studio | Administração do banco |
| SQL | Consultas e manipulação dos dados |
| Power BI Desktop | Dashboards e indicadores |
| Git | Controle de versão |
| GitHub | Hospedagem do projeto |
| Draw.io | Diagramas |
| Visual Studio Code | Desenvolvimento da documentação e scripts |

---

# 14. Benefícios Esperados

Ao final do projeto espera-se:

- centralização dos dados corporativos;
- padronização dos indicadores;
- maior confiabilidade das informações;
- redução de retrabalho;
- melhoria na tomada de decisão;
- análises históricas de vendas;
- dashboards interativos para diferentes áreas da empresa.

---

# 15. Cronograma Macro

| Etapa | Status |
|---------|--------|
| Documento de Visão | ✅ |
| Levantamento de Requisitos | ⏳ |
| Regras de Negócio | ⏳ |
| Modelagem Conceitual | ⏳ |
| Modelo Lógico | ⏳ |
| Banco OLTP | ⏳ |
| Consultas SQL | ⏳ |
| ETL | ⏳ |
| Data Warehouse | ⏳ |
| Data Marts | ⏳ |
| Power BI | ⏳ |
| Documentação Final | ⏳ |

---

# 16. Critérios de Sucesso

O projeto será considerado concluído quando:

- o banco de dados operacional estiver implementado;
- o processo ETL estiver funcionando corretamente;
- o Data Warehouse estiver populado;
- os Data Marts estiverem disponíveis para consulta;
- os dashboards apresentarem todos os KPIs definidos;
- toda a documentação estiver publicada no GitHub.

---

# 17. Conclusão

O projeto Retail Analytics tem como objetivo simular o desenvolvimento completo de uma solução de Business Intelligence aplicada ao setor de varejo.

Ao longo do projeto serão aplicados conceitos de modelagem de dados, SQL Server, ETL, Data Warehouse, Data Marts e Power BI, reproduzindo etapas comuns em projetos reais de análise de dados.

Além de consolidar conhecimentos técnicos, este projeto servirá como portfólio profissional, demonstrando a capacidade de desenvolver soluções analíticas completas, documentadas e alinhadas às boas práticas do mercado.