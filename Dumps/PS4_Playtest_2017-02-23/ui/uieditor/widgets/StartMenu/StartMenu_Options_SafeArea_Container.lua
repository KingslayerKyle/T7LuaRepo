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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	
	local backgroundImage = LUI.UIImage.new()
	backgroundImage:setLeftRight( 0, 1, 0, 0 )
	backgroundImage:setTopBottom( 0, 1, 0, 0 )
	backgroundImage:setRGB( 0, 0, 0 )
	backgroundImage:setAlpha( 0.7 )
	self:addElement( backgroundImage )
	self.backgroundImage = backgroundImage
	
	local upArrow = LUI.UIImage.new()
	upArrow:setLeftRight( 0.5, 0.5, -48, 48 )
	upArrow:setTopBottom( 0, 0, 0, 96 )
	upArrow:setZRot( 270 )
	upArrow:setImage( RegisterImage( "safe_area_arrow" ) )
	self:addElement( upArrow )
	self.upArrow = upArrow
	
	local downArrow = LUI.UIImage.new()
	downArrow:setLeftRight( 0.5, 0.5, -48, 48 )
	downArrow:setTopBottom( 1, 1, -96, 0 )
	downArrow:setZRot( 90 )
	downArrow:setImage( RegisterImage( "safe_area_arrow" ) )
	self:addElement( downArrow )
	self.downArrow = downArrow
	
	local leftArrow = LUI.UIImage.new()
	leftArrow:setLeftRight( 0, 0, 0, 96 )
	leftArrow:setTopBottom( 0.5, 0.5, -48, 48 )
	leftArrow:setImage( RegisterImage( "safe_area_arrow" ) )
	self:addElement( leftArrow )
	self.leftArrow = leftArrow
	
	local rightArrow = LUI.UIImage.new()
	rightArrow:setLeftRight( 1, 1, -96, 0 )
	rightArrow:setTopBottom( 0.5, 0.5, -48, 48 )
	rightArrow:setZRot( 180 )
	rightArrow:setImage( RegisterImage( "safe_area_arrow" ) )
	self:addElement( rightArrow )
	self.rightArrow = rightArrow
	
	self.resetProperties = function ()
		backgroundImage:completeAnimation()
		backgroundImage:setAlpha( 0.7 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				backgroundImage:completeAnimation()
				self.backgroundImage:setAlpha( 0 )
				self.clipFinished( backgroundImage, {} )
			end
		},
		FirstTime = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
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

