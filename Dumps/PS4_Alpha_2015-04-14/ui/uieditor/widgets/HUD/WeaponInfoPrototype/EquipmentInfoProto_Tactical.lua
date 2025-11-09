CoD.EquipmentInfoProto_Tactical = InheritFrom( LUI.UIElement )
CoD.EquipmentInfoProto_Tactical.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EquipmentInfoProto_Tactical )
	self.id = "EquipmentInfoProto_Tactical"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 54 )
	self:setTopBottom( true, false, 0, 37 )
	
	local Tactical = LUI.UIImage.new()
	Tactical:setLeftRight( false, true, -54, -20 )
	Tactical:setTopBottom( false, true, -36.55, 0 )
	Tactical:setRGB( 1, 1, 1 )
	Tactical:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	Tactical:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Tactical:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Tactical )
	self.Tactical = Tactical
	
	local TacticalCount = LUI.UIText.new()
	TacticalCount:setLeftRight( false, true, -20, 0 )
	TacticalCount:setTopBottom( false, true, -12, 0 )
	TacticalCount:setRGB( 1, 1, 1 )
	TacticalCount:setTTF( "fonts/UnitedSansRgMd.ttf" )
	TacticalCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TacticalCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TacticalCount:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhandCount", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TacticalCount:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TacticalCount )
	self.TacticalCount = TacticalCount
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Tactical:completeAnimation()
				self.Tactical:setAlpha( 1 )
				self.clipFinished( Tactical, {} )
				TacticalCount:completeAnimation()
				self.TacticalCount:setAlpha( 1 )
				self.clipFinished( TacticalCount, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Tactical:completeAnimation()
				self.Tactical:setAlpha( 0 )
				self.clipFinished( Tactical, {} )
				TacticalCount:completeAnimation()
				self.TacticalCount:setAlpha( 0 )
				self.clipFinished( TacticalCount, {} )
			end
		}
	}
	self.close = function ( self )
		self.Tactical:close()
		self.TacticalCount:close()
		CoD.EquipmentInfoProto_Tactical.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

