CoD.StartMenu_Button_Emblem_Internal = InheritFrom( LUI.UIElement )
CoD.StartMenu_Button_Emblem_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Button_Emblem_Internal )
	self.id = "StartMenu_Button_Emblem_Internal"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 294 )
	self:setTopBottom( true, false, 0, 134 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local emblem0 = LUI.UIImage.new()
	emblem0:setLeftRight( true, true, 0, 0 )
	emblem0:setTopBottom( true, true, 0, 0 )
	emblem0:subscribeToGlobalModel( controller, "PerController", "xuid", function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			emblem0:setupPlayerEmblemByXUID( xuid )
		end
	end )
	self:addElement( emblem0 )
	self.emblem0 = emblem0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				emblem0:completeAnimation()
				self.emblem0:setAlpha( 0.79 )
				self.clipFinished( emblem0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				emblem0:completeAnimation()
				self.emblem0:setAlpha( 1 )
				self.clipFinished( emblem0, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.emblem0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

