-- e559e327360c574e7bce28fd6e7ad563
-- This hash is used for caching, delete to decompile the file again

CoD.StartMenu_DifficultyIcon = InheritFrom( LUI.UIElement )
CoD.StartMenu_DifficultyIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_DifficultyIcon )
	self.id = "StartMenu_DifficultyIcon"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 99 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 74.73 )
	Image0:setTopBottom( true, false, 0, 74.73 )
	Image0:subscribeToGlobalModel( controller, "CampaignSettings", "difficultyIcon", function ( model )
		local difficultyIcon = Engine.GetModelValue( model )
		if difficultyIcon then
			Image0:setImage( RegisterImage( difficultyIcon ) )
		end
	end )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Image0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
