CREATE TABLE usuario(
    id bigint NOT NULL,
    nome text NOT NULL,
    cpf text NOT NULL,
    email text NOT NULL,
    created_at TIMESTAMP NOT NULL,
    ativo boolean,
    perfil_id int NOT NULL,
    senha text NOT NULL,
    CONSTRAINT usuario_pk PRIMARY KEY (id)
);

CREATE TABLE perfis(
    id bigint NOT NULL,
    nome text NOT NULL,
    created_at TIMESTAMP NOT NULL,
    CONSTRAINT perfis_pk PRIMARY KEY (id)
);

CREATE TABLE permissoes(
    id bigint NOT NULL,
    nome text NOT NULL,
    created_at TIMESTAMP NOT NULL,
    CONSTRAINT permissoes_pk PRIMARY KEY (id)
);

CREATE TABLE rel_permissao_perfil(
    id bigint NOT NULL,
    permissao_id bigint,
    perfil_id bigint,
    created_at TIMESTAMP NOT NULL,
    CONSTRAINT rel_permissao_perfil_pk PRIMARY KEY (id),
    CONSTRAINT permissao_fk FOREIGN KEY (permissao_id) REFERENCES permissoes(id),
    CONSTRAINT perfil_fk FOREIGN KEY (perfil_id) REFERENCES perfis(id)
);

CREATE TABLE evento(
    id bigint NOT NULL,
    nome text NOT NULL,
    data_evento TIMESTAMP NOT NULL,
    duracao DECIMAL NOT NULL,
    texto text,
    id_usuario bigint NOT NULL,
    created_at TIMESTAMP NOT NULL,
    CONSTRAINT evento_pk PRIMARY KEY (id),
    CONSTRAINT id_usuario_fk FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

CREATE TABLE rel_participante_evento(
    id bigint NOT NULL,
    usuario_id bigint NOT NULL,
    evento_id bigint NOT NULL,
    created_at TIMESTAMP not NULL,
    CONSTRAINT rel_participante_evento_pk PRIMARY KEY (id),
    CONSTRAINT rel_usuario_evento_fk FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    CONSTRAINT rel_evento_id_fk FOREIGN KEY (evento_id) REFERENCES evento(id)
);

CREATE TABLE certificado(
    id bigint NOT NULL,
    rel_participante_evento bigint NOT NULL,
    protocolo text NOT NULL,
    num_downloads int,
    last_download TIMESTAMP,
    created_at TIMESTAMP NOT NULL,
    CONSTRAINT certificado_pk PRIMARY KEY (id),
    CONSTRAINT participante_evento_fk FOREIGN KEY (rel_participante_evento) REFERENCES rel_participante_evento(id)
);

CREATE TABLE feature_toogle(
    id int not null,
    feature text NOT NULL,
    ativo boolean,
    created_at TIMESTAMP NOT NULL,
    CONSTRAINT feature_toogle_pk PRIMARY KEY (id)
);