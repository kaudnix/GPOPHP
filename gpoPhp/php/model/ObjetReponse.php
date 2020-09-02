<?php

class Reponse{
    private $idReponse;
    private $libelReponse;
    private $heureReponse;
    private $minuteReponse;
    private $dateReponse;
    private $selectedReponse;

    /**
     * Reponse constructor.
     * @param $idReponse
     * @param $libelReponse
     * @param $heureReponse
     * @param $minuteReponse
     * @param $dateReponse
     * @param $selectedReponse
     */
    public function __construct($idReponse, $libelReponse, $heureReponse, $minuteReponse, $dateReponse, $selectedReponse)
    {
        $this->idReponse = $idReponse;
        $this->libelReponse = $libelReponse;
        $this->heureReponse = $heureReponse;
        $this->minuteReponse = $minuteReponse;
        $this->dateReponse = $dateReponse;
        $this->selectedReponse = $selectedReponse;
    }

    /**
     * @return mixed
     */
    public function getIdReponse()
    {
        return $this->idReponse;
    }

    /**
     * @param mixed $idReponse
     */
    public function setIdReponse($idReponse)
    {
        $this->idReponse = $idReponse;
    }

    /**
     * @return mixed
     */
    public function getLibelReponse()
    {
        return $this->libelReponse;
    }

    /**
     * @param mixed $libelReponse
     */
    public function setLibelReponse($libelReponse)
    {
        $this->libelReponse = $libelReponse;
    }

    /**
     * @return mixed
     */
    public function getHeureReponse()
    {
        return $this->heureReponse;
    }

    /**
     * @param mixed $heureReponse
     */
    public function setHeureReponse($heureReponse)
    {
        $this->heureReponse = $heureReponse;
    }

    /**
     * @return mixed
     */
    public function getMinuteReponse()
    {
        return $this->minuteReponse;
    }

    /**
     * @param mixed $minuteReponse
     */
    public function setMinuteReponse($minuteReponse)
    {
        $this->minuteReponse = $minuteReponse;
    }

    /**
     * @return mixed
     */
    public function getDateReponse()
    {
        return $this->dateReponse;
    }

    /**
     * @param mixed $dateReponse
     */
    public function setDateReponse($dateReponse)
    {
        $this->dateReponse = $dateReponse;
    }

    /**
     * @return mixed
     */
    public function getSelectedReponse()
    {
        return $this->selectedReponse;
    }

    /**
     * @param mixed $selectedReponse
     */
    public function setSelectedReponse($selectedReponse)
    {
        $this->selectedReponse = $selectedReponse;
    }

}
