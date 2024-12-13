//
//  planets.swift
//  SimpleSpace
//
//  Created by Giuseppe Rocco on 10/12/24.
//

let planets: [Planet] = [
    Planet(
        name: "Mercury",
        imgname: "mercury",
        description: "Mercury is the smallest planet in the Solar System and the closest to the Sun. Its surface is heavily cratered and similar in appearance to the Moon. With virtually no atmosphere, Mercury experiences extreme temperature swings, making it one of the most inhospitable places in the Solar System.",
        diameter: 4879.4,
        mass: 3.3011e23,
        distanceFromSun: 57.91,
        orbitalPeriod: 88.0,
        numberOfMoons: 0,
        hasRings: false
    ),
    Planet(
        name: "Venus",
        imgname: "venus",
        description: "Venus is often called Earth's twin because of its similar size and composition, but its thick, toxic atmosphere makes it vastly different. The planet is shrouded in clouds of sulfuric acid, and its runaway greenhouse effect results in surface temperatures hot enough to melt lead.",
        diameter: 12104.0,
        mass: 4.8675e24,
        distanceFromSun: 108.2,
        orbitalPeriod: 225.0,
        numberOfMoons: 0,
        hasRings: false
    ),
    Planet(
        name: "Earth",
        imgname: "earth",
        description: "Earth is the only planet known to support life, thanks to its liquid water, breathable atmosphere, and magnetic field that protects it from harmful solar radiation. It is home to diverse ecosystems and a variety of life forms.",
        diameter: 12742.0,
        mass: 5.97237e24,
        distanceFromSun: 149.6,
        orbitalPeriod: 365.25,
        numberOfMoons: 1,
        hasRings: false
    ),
    Planet(
        name: "Mars",
        imgname: "mars",
        description: "Known as the Red Planet, Mars is a cold desert world with a thin atmosphere. It has the largest volcano in the Solar System, Olympus Mons, and evidence suggests it once had liquid water on its surface, raising the possibility of past microbial life.",
        diameter: 6779.0,
        mass: 6.4171e23,
        distanceFromSun: 227.9,
        orbitalPeriod: 687.0,
        numberOfMoons: 2,
        hasRings: false
    ),
    Planet(
        name: "Jupiter",
        imgname: "jupiter",
        description: "Jupiter is the largest planet in the Solar System and a gas giant made mostly of hydrogen and helium. Its Great Red Spot, a massive storm larger than Earth, has raged for centuries. Jupiter has a strong magnetic field and dozens of moons, including the four large Galilean moons.",
        diameter: 139820.0,
        mass: 1.8982e27,
        distanceFromSun: 778.5,
        orbitalPeriod: 4333.0,
        numberOfMoons: 79,
        hasRings: true
    ),
    Planet(
        name: "Saturn",
        imgname: "saturn",
        description: "Famous for its stunning ring system, Saturn is the second-largest planet in the Solar System. The rings are made of ice and rock particles, and the planet has numerous moons, including Titan, which has a thick atmosphere and surface lakes of liquid methane.",
        diameter: 116460.0,
        mass: 5.6834e26,
        distanceFromSun: 1434.0,
        orbitalPeriod: 10759.0,
        numberOfMoons: 83,
        hasRings: true
    ),
    Planet(
        name: "Uranus",
        imgname: "uranus",
        description: "Uranus is an ice giant with a pale blue color due to methane in its atmosphere. Its axis of rotation is tilted sideways, making it appear to roll along its orbit. Uranus has faint rings and numerous moons.",
        diameter: 50724.0,
        mass: 8.6810e25,
        distanceFromSun: 2871.0,
        orbitalPeriod: 30687.0,
        numberOfMoons: 27,
        hasRings: true
    ),
    Planet(
        name: "Neptune",
        imgname: "neptune",
        description: "Neptune is the farthest planet from the Sun and another ice giant. It has a deep blue color, supersonic winds, and faint rings. Triton, its largest moon, is geologically active and has geysers that erupt nitrogen gas.",
        diameter: 49244.0,
        mass: 1.02413e26,
        distanceFromSun: 4495.1,
        orbitalPeriod: 60190.0,
        numberOfMoons: 14,
        hasRings: true
    )
]
