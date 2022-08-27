-- c88f9825d1355cc99b5258b876e8daca
-- This hash is used for caching, delete to decompile the file again

CoD.ElementalArrowItem = InheritFrom( LUI.UIElement )
CoD.ElementalArrowItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ElementalArrowItem )
	self.id = "ElementalArrowItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 63 )
	self:setTopBottom( true, false, 0, 61 )
	
	local BackgroundCircle = LUI.UIImage.new()
	BackgroundCircle:setLeftRight( true, false, 0, 60 )
	BackgroundCircle:setTopBottom( true, false, 0, 60 )
	BackgroundCircle:setImage( RegisterImage( "uie_t7_icon_inventory_dlc_quest_basebar" ) )
	self:addElement( BackgroundCircle )
	self.BackgroundCircle = BackgroundCircle
	
	local BackgroundComplete = LUI.UIImage.new()
	BackgroundComplete:setLeftRight( true, false, 0, 60 )
	BackgroundComplete:setTopBottom( true, false, 0, 60 )
	BackgroundComplete:setImage( RegisterImage( "uie_t7_icon_inventory_dlc_quest_sigil_demon" ) )
	self:addElement( BackgroundComplete )
	self.BackgroundComplete = BackgroundComplete
	
	local CircleFill = LUI.UIImage.new()
	CircleFill:setLeftRight( true, false, 0, 60 )
	CircleFill:setTopBottom( true, false, 0, 60 )
	CircleFill:setImage( RegisterImage( "uie_t7_icon_inventory_dlc_quest_basebar_fill" ) )
	CircleFill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	CircleFill:setShaderVector( 0, 0.56, 0, 0, 0 )
	CircleFill:setShaderVector( 1, 0.5, 0, 0, 0 )
	CircleFill:setShaderVector( 2, 0.5, 0, 0, 0 )
	CircleFill:setShaderVector( 3, 0.02, 0.02, 0, 0 )
	self:addElement( CircleFill )
	self.CircleFill = CircleFill
	
	local CircleComplete = LUI.UIImage.new()
	CircleComplete:setLeftRight( true, false, 0, 60 )
	CircleComplete:setTopBottom( true, false, 0, 60 )
	CircleComplete:setAlpha( 0 )
	CircleComplete:setImage( RegisterImage( "uie_t7_icon_inventory_dlc_quest_basebar_ready" ) )
	self:addElement( CircleComplete )
	self.CircleComplete = CircleComplete
	
	local ArrowComplete = LUI.UIImage.new()
	ArrowComplete:setLeftRight( true, false, 0, 60 )
	ArrowComplete:setTopBottom( true, false, 0, 60 )
	ArrowComplete:setImage( RegisterImage( "uie_t7_icon_inventory_dlc_quest_arrow_fixed_demon" ) )
	self:addElement( ArrowComplete )
	self.ArrowComplete = ArrowComplete
	
	local ArrowBroken = LUI.UIImage.new()
	ArrowBroken:setLeftRight( true, false, 0, 60 )
	ArrowBroken:setTopBottom( true, false, 0, 60 )
	ArrowBroken:setImage( RegisterImage( "uie_t7_icon_inventory_dlc_quest_arrow_broken_demon" ) )
	self:addElement( ArrowBroken )
	self.ArrowBroken = ArrowBroken
	
	local PlayerImage = LUI.UIImage.new()
	PlayerImage:setLeftRight( true, false, 27.5, 63 )
	PlayerImage:setTopBottom( true, false, 25.5, 61 )
	self:addElement( PlayerImage )
	self.PlayerImage = PlayerImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				BackgroundCircle:completeAnimation()
				self.BackgroundCircle:setAlpha( 0 )
				self.clipFinished( BackgroundCircle, {} )
				BackgroundComplete:completeAnimation()
				self.BackgroundComplete:setAlpha( 0 )
				self.clipFinished( BackgroundComplete, {} )
				CircleFill:completeAnimation()
				self.CircleFill:setAlpha( 0 )
				self.clipFinished( CircleFill, {} )
				CircleComplete:completeAnimation()
				self.CircleComplete:setAlpha( 0 )
				self.clipFinished( CircleComplete, {} )
				ArrowComplete:completeAnimation()
				self.ArrowComplete:setAlpha( 0 )
				self.clipFinished( ArrowComplete, {} )
				ArrowBroken:completeAnimation()
				self.ArrowBroken:setAlpha( 0 )
				self.clipFinished( ArrowBroken, {} )
				PlayerImage:completeAnimation()
				self.PlayerImage:setAlpha( 0 )
				self.clipFinished( PlayerImage, {} )
			end
		},
		Finished = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				BackgroundCircle:completeAnimation()
				self.BackgroundCircle:setAlpha( 1 )
				self.clipFinished( BackgroundCircle, {} )
				BackgroundComplete:completeAnimation()
				self.BackgroundComplete:setAlpha( 1 )
				self.clipFinished( BackgroundComplete, {} )
				CircleFill:completeAnimation()
				self.CircleFill:setAlpha( 1 )
				self.clipFinished( CircleFill, {} )
				CircleComplete:completeAnimation()
				self.CircleComplete:setAlpha( 1 )
				self.clipFinished( CircleComplete, {} )
				ArrowComplete:completeAnimation()
				self.ArrowComplete:setAlpha( 1 )
				self.clipFinished( ArrowComplete, {} )
				ArrowBroken:completeAnimation()
				self.ArrowBroken:setAlpha( 0 )
				self.clipFinished( ArrowBroken, {} )
				PlayerImage:completeAnimation()
				self.PlayerImage:setAlpha( 1 )
				self.clipFinished( PlayerImage, {} )
			end
		},
		MostlyFinished = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				BackgroundCircle:completeAnimation()
				self.BackgroundCircle:setAlpha( 1 )
				self.clipFinished( BackgroundCircle, {} )
				BackgroundComplete:completeAnimation()
				self.BackgroundComplete:setAlpha( 0 )
				self.clipFinished( BackgroundComplete, {} )
				CircleFill:completeAnimation()
				self.CircleFill:setAlpha( 1 )
				self.clipFinished( CircleFill, {} )
				CircleComplete:completeAnimation()
				self.CircleComplete:setAlpha( 0 )
				self.clipFinished( CircleComplete, {} )
				ArrowComplete:completeAnimation()
				self.ArrowComplete:setAlpha( 1 )
				self.clipFinished( ArrowComplete, {} )
				ArrowBroken:completeAnimation()
				self.ArrowBroken:setAlpha( 0 )
				self.clipFinished( ArrowBroken, {} )
				PlayerImage:completeAnimation()
				self.PlayerImage:setAlpha( 1 )
				self.clipFinished( PlayerImage, {} )
			end
		},
		InProgress = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				BackgroundCircle:completeAnimation()
				self.BackgroundCircle:setAlpha( 1 )
				self.clipFinished( BackgroundCircle, {} )
				BackgroundComplete:completeAnimation()
				self.BackgroundComplete:setAlpha( 0 )
				self.clipFinished( BackgroundComplete, {} )
				CircleFill:completeAnimation()
				self.CircleFill:setAlpha( 1 )
				self.clipFinished( CircleFill, {} )
				CircleComplete:completeAnimation()
				self.CircleComplete:setAlpha( 0.02 )
				self.clipFinished( CircleComplete, {} )
				ArrowComplete:completeAnimation()
				self.ArrowComplete:setAlpha( 0 )
				self.clipFinished( ArrowComplete, {} )
				ArrowBroken:completeAnimation()
				self.ArrowBroken:setAlpha( 1 )
				self.clipFinished( ArrowBroken, {} )
				PlayerImage:completeAnimation()
				self.PlayerImage:setAlpha( 1 )
				self.clipFinished( PlayerImage, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

