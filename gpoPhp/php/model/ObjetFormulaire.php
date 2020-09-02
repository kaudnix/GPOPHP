<?php

class Formulaire{
    private $idForm;
    private $dateEnvoi;

    /**
     * @return mixed
     */
    public function getIdForm()
    {
        return $this->idForm;
    }

    /**
     * @param mixed $idForm
     */
    public function setIdForm($idForm)
    {
        $this->idForm = $idForm;
    }

    /**
     * @return mixed
     */
    public function getDateEnvoi()
    {
        return $this->dateEnvoi;
    }

    /**
     * @param mixed $dateEnvoi
     */
    public function setDateEnvoi($dateEnvoi)
    {
        $this->dateEnvoi = $dateEnvoi;
    }

    public function __construct($unId, $dateEnvoi)
    {
        $this->idForm = $unId;
        $this->dateEnvoi = $dateEnvoi;
    }
}
