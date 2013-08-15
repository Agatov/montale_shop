class Cart

  attr_accessor :count, :summ, :volumes

  def initialize
    self.count = 0
    self.summ = 0
    self.volumes = []
  end

  def add(volume)
    volume_hash = {id: volume.id, count: 1, summ: volume.price }
    similiar_volume = volumes.find { |v| v[:id] == volume.id }

    if similiar_volume
      similiar_volume[:summ] += volume.price
      similiar_volume[:count] += 1
    else
      self.volumes << volume_hash
    end

    self.summ += volume.price
    self.count += 1
  end


  def remove(volume)

    similiar_volume = self.volumes.find { |v| v[:id] == volume.id }

    self.volumes = self.volumes - [similiar_volume]
    self.count -= similiar_volume[:count]
    self.summ -= similiar_volume[:summ]
  end

  def find_volume(volume)
    volumes.find { |v| v[:id] == volume.id}
  end

end