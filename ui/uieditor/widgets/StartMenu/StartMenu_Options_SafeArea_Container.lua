-- dcb97a81a8059a5abd75359dec3ac232
-- This hash is used for caching, delete to decompile the file again

CoD.StartMenu_Options_SafeArea_Container = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_SafeArea_Container.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_SafeArea_Container )
	self.id = "StartMenu_Options_SafeArea_Container"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	local backgroundImage = LUI.UIImage.new()
	backgroundImage:setLeftRight( true, true, 0, 0 )
	backgroundImage:setTopBottom( true, true, 0, 0 )
	backgroundImage:setRGB( 0, 0, 0 )
	backgroundImage:setAlpha( 0.7 )
	self:addElement( backgroundImage )
	self.backgroundImage = backgroundImage
	
	local upArrow = LUI.UIImage.new()
	upArrow:setLeftRight( false, false, -32, 32 )
	upArrow:setTopBottom( true, false, 0, 64 )
	upArrow:setZRot( 270 )
	upArrow:setImage( RegisterImage( "uie_safe_area_arrow" ) )
	self:addElement( upArrow )
	self.upArrow = upArrow
	
	local downArrow = LUI.UIImage.new()
	downArrow:setLeftRight( false, false, -32, 32 )
	downArrow:setTopBottom( false, true, -64, 0 )
	downArrow:setZRot( 90 )
	downArrow:setImage( RegisterImage( "uie_safe_area_arrow" ) )
	self:addElement( downArrow )
	self.downArrow = downArrow
	
	local leftArrow = LUI.UIImage.new()
	leftArrow:setLeftRight( true, false, 0, 64 )
	leftArrow:setTopBottom( false, false, -32, 32 )
	leftArrow:setImage( RegisterImage( "uie_safe_area_arrow" ) )
	self:addElement( leftArrow )
	self.leftArrow = leftArrow
	
	local rightArrow = LUI.UIImage.new()
	rightArrow:setLeftRight( false, true, -64, 0 )
	rightArrow:setTopBottom( false, false, -32, 32 )
	rightArrow:setZRot( 180 )
	rightArrow:setImage( RegisterImage( "uie_safe_area_arrow" ) )
	self:addElement( rightArrow )
	self.rightArrow = rightArrow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				backgroundImage:completeAnimation()
				self.backgroundImage:setAlpha( 0 )
				self.clipFinished( backgroundImage, {} )
			end
		},
		FirstTime = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				backgroundImage:completeAnimation()
				self.backgroundImage:setAlpha( 0.7 )
				self.clipFinished( backgroundImage, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "FirstTime",
			condition = function ( menu, element, event )
				return IsMainFirstTimeSetup( controller )
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

