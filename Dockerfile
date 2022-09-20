FROM hashicorp/terraform:latest as terraform
FROM homebrew/brew as base_image

COPY --from=terraform /bin/terraform /usr/bin/
ENV HOMEBREW_NO_INSTALL_CLEANUP=1

RUN brew install pre-commit     # https://pre-commit.com/#install
RUN brew install checkov        # https://github.com/bridgecrewio/checkov
RUN brew install tfsec          # https://aquasecurity.github.io/tfsec/
RUN brew install terraform-docs # https://github.com/terraform-docs/terraform-docs
RUN brew install tflint         # https://github.com/terraform-linters/tflint
